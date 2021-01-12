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
        
        print(soundFileName)
        print("playSound")
        guard let bundle = Bundle.main.path(forResource: soundFileName, ofType: "wav") else {return}
        let soundFileNameUrl = URL(fileURLWithPath: bundle)
        print(soundFileNameUrl)
        if let player = players[soundFileNameUrl] {
            print("\n\n\n player--->>>")
            print(player)
            if !player.isPlaying {
                player.prepareToPlay()
                player.play()
            } else {
                do {
                    let dublicatePlayer = try AVAudioPlayer(contentsOf: soundFileNameUrl)
                    print("\n\n\n dublicatePlayer--->>>")
                    print(dublicatePlayer)
                    dublicatePlayer.delegate = self
                    dublicatePlayers.append(dublicatePlayer)
                    dublicatePlayer.prepareToPlay()
                    dublicatePlayer.play()
                } catch let error {
                    print("\n\n\n error 1--->>>\n\n\n")
                    print(error.localizedDescription)
                }
            }
        } else {
            print("\n\n\n else \n\n\n")
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileNameUrl)
                players[soundFileNameUrl] = player
                player.prepareToPlay()
                player.play()
            } catch let error {
                print("\n\n\n error 2--->>>\n\n\n")
                print(error.localizedDescription)
            }
        }
    }
    func playSoundsForArray(soundFileNames: [String]) {
        for soundFileName in soundFileNames {
                    playSound(soundFileName: soundFileName)
                }
    }
    func playSoundsForString(soundFileNames: String...) {
        for soundFileName in soundFileNames {
                    playSound(soundFileName: soundFileName)
                }
    }
    func playSounds(soundFileNames: [String], withDelay: Double) { //withDelay is in seconds
           for (index, soundFileName) in soundFileNames.enumerated() {
               let delay = withDelay * Double(index)
               let _ = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(playSoundNotification(_:)), userInfo: ["fileName": soundFileName], repeats: false)
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
