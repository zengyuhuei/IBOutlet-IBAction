//
//  ViewController.swift
//  IBOutlet
//
//  Created by User16 on 2019/4/9.
//  Copyright © 2019 User16. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var looper: AVPlayerLooper?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = URL(string: "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview118/v4/69/0e/98/690e98db-440d-cb0c-2bff-91b00a05bdda/mzaf_1674062311671795807.plus.aac.p.m4a") {
            let player = AVQueuePlayer()
            let item = AVPlayerItem(url: url)
            looper = AVPlayerLooper(player: player, templateItem: item)
            player.play()
        }
    
        func testFieldShouldReturn(_ textField: UITextField) -> Bool{
            textField.resignFirstResponder();
            return true;
        }



    }
}
