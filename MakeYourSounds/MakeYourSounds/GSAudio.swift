//
//  GSAudio.swift
//  MakeYourSounds
//
//  Created by AnnaDanylova on 12.01.2021.
//

import Foundation
import AVFoundation

class GSAudio: NSObject, AVAudioPlayerDelegate {
    
    static let sharedInstance = GSAudio()
    
    private override init() {}
    
    var players: [URL: AVAudioPlayer] = [:]
    var dublicatePlayers: [AVAudioPlayer] = []
    
    func playSound(soundFileName: String) {
        guard let bundle = Bundle.main.path(forResource: soundFileName, ofType: "wav") else {return}
        let soundFileNameUrl = URL(fileURLWithPath: bundle)
        print(soundFileNameUrl)
        if let player = players[soundFileNameUrl] {
            print(player)
            if !player.isPlaying {
                player.prepareToPlay()
                player.play()
            } else {
                do {
                    let dublicatePlayer = try AVAudioPlayer(contentsOf: soundFileNameUrl)
                    print(dublicatePlayer)
                    dublicatePlayer.delegate = self
                    dublicatePlayers.append(dublicatePlayer)
                    dublicatePlayer.prepareToPlay()
                    dublicatePlayer.play()
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        } else {
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileNameUrl)
                players[soundFileNameUrl] = player
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    @objc func playSoundNotification(_ notification: NSNotification) {
            if let soundFileName = notification.userInfo?["fileName"] as? String {
                playSound(soundFileName: soundFileName)
            }
        }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let index = dublicatePlayers.firstIndex(of: player) {
                dublicatePlayers.remove(at: index)
            }
        }
}
