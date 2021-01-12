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
        
        if title == "A" {
            GSAudio.sharedInstance.playSound(soundFileName: "A")
        }
        else if title == "B" {
            GSAudio.sharedInstance.playSound(soundFileName: "B")
        }
        else if title == "C" {
            GSAudio.sharedInstance.playSound(soundFileName: "C")
        }
        else if title == "D" {
            GSAudio.sharedInstance.playSound(soundFileName: "D")
        }
        else if title == "E" {
            GSAudio.sharedInstance.playSound(soundFileName: "E")
        }
        else if title == "F" {
            GSAudio.sharedInstance.playSound(soundFileName: "F÷")
        }
        else if title == "G" {
            GSAudio.sharedInstance.playSound(soundFileName: "G")
        }
        else if title == "H" {
            GSAudio.sharedInstance.playSound(soundFileName: "H")
        }
        else if title == "I" {
            GSAudio.sharedInstance.playSound(soundFileName: "I")
        }
        else if title == "J" {
            GSAudio.sharedInstance.playSound(soundFileName: "J")
        }
        else if title == "K" {
            GSAudio.sharedInstance.playSound(soundFileName: "K")
        }
        else if title == "L" {
            GSAudio.sharedInstance.playSound(soundFileName: "L")
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

