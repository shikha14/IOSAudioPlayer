//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Shikha Gupta on 14/11/16.
//  Copyright © 2016 shikha. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer = AVAudioPlayer()

   
    
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var seekSlider: UISlider!
    
    
    
    @IBAction func onSeekChanged(_ sender: Any) {
        player.currentTime = TimeInterval(seekSlider.value)
    }
    
    
    
    @IBAction func onVolumeChanged(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    
    @IBAction func onStop(_ sender: Any) {
        let audioPath = Bundle.main.path(forResource: "themesong", ofType: "mp3")
        
        do{
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
          
        }catch{
            
        }
    }
    
    
    @IBAction func onPause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func onPlay(_ sender: Any) {
        player.play()
    }
    
    
    func updateTimer()
    {
        seekSlider.value = Float(player.currentTime)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let audioPath = Bundle.main.path(forResource: "themesong", ofType: "mp3")
        
        do{
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            seekSlider.maximumValue = Float(player.duration)
            
            
            _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats:true)
            
            
        
        }catch{
        
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

