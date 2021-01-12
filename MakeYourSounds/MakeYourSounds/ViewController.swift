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
        GSAudio.sharedInstance.playSound(soundFileName: title)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

