//
//  ViewController.swift
//  UApp
//
//  Created by Németh Tamás on 2020. 05. 02..
//  Copyright © 2020. Németh Tamás. All rights reserved.
//

import UIKit
import AVKit
class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(LoginButton)
        Utilities.styleFilledButton(SignUpButton)
    }
    
    func setUpVideo() {
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "young-woman-and-man-riding-a-bicycle-at-the-shore-and-having-some-fun-slow-motion_hwud0nwu__WL", ofType:"mp4")
        
        guard bundlePath != nil else {
            return
        }
        //Create a URL frim it
        let url = URL(fileURLWithPath: bundlePath!)

        //Create video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // ADd ut to the view and play it
        videoPlayer?.playImmediately(atRate: 0.5)
    }
}


