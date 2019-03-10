//
//  XyloPhoneMasterViewController.swift
//  XyloPhone Master
//
//  Created by Anand on 2/28/19.
//  Copyright © 2019 Anand. All rights reserved.
//

import UIKit
import AVFoundation

class XyloPhoneMasterViewController: UIViewController, AVAudioPlayerDelegate {
    
    let xyloPhoneKeyNotesArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var audioPlayer: AVAudioPlayer!
    var selectedSoundFileName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        selectedSoundFileName = xyloPhoneKeyNotesArray[(sender.tag)-1]
        
        playXyloKeynote()
    }
    
    func playXyloKeynote() {
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
        } catch {
            print("ERROR PLAYING SOUND \(error.localizedDescription)")
        }
    }
    
    @IBAction func appInfo(_ sender: UIButton) {
        let alert = UIAlertController(title: "XyloPhone Master", message: "Created By: Rajeev Kulariya", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

