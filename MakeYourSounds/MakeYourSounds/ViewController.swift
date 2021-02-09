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
        
        switch title {
        case "Do":
            GSAudio.sharedInstance.playSound(soundFileName: "Do")
        case "Re":
            GSAudio.sharedInstance.playSound(soundFileName: "Re")
        case "Mi":
            GSAudio.sharedInstance.playSound(soundFileName: "Mi")
        case "Fa":
            GSAudio.sharedInstance.playSound(soundFileName: "Fa")
        case "Sol":
            GSAudio.sharedInstance.playSound(soundFileName: "Sol")
        case "La":
            GSAudio.sharedInstance.playSound(soundFileName: "La")
        case "Si":
            GSAudio.sharedInstance.playSound(soundFileName: "Si")
        default:
            print("error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

