//
//  ViewController.swift
//  MakeYourSounds
//
//  Created by AnnaDanylova on 12.01.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBAction func pressed(_ sender: UIButton) {
        guard let title = sender.currentTitle else {return}
        print(title)
        
        switch title {
        case "A":
            GSAudio.sharedInstance.playSound(soundFileName: "A")
        case "B":
            GSAudio.sharedInstance.playSound(soundFileName: "B")
        case "C":
            GSAudio.sharedInstance.playSound(soundFileName: "C")
        case "D":
            GSAudio.sharedInstance.playSound(soundFileName: "D")
        case "E":
            GSAudio.sharedInstance.playSound(soundFileName: "E")
        case "F":
            GSAudio.sharedInstance.playSound(soundFileName: "F")
        case "G":
            GSAudio.sharedInstance.playSound(soundFileName: "G")
        case "H":
            GSAudio.sharedInstance.playSound(soundFileName: "H")
        case "I":
            GSAudio.sharedInstance.playSound(soundFileName: "I")
        case "J":
            GSAudio.sharedInstance.playSound(soundFileName: "J")
        case "K":
            GSAudio.sharedInstance.playSound(soundFileName: "K")
        case "L":
            GSAudio.sharedInstance.playSound(soundFileName: "L")
        default:
            print("error")
        }

//        let soundFileNames = sounds
//        GSAudio.sharedInstance.playSound(soundFileName: soundFileNames)
        
//        GSAudio.sharedInstance.playSounds(soundFileNames: soundFileNames, withDelay: 3.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

