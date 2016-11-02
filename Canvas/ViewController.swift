//
//  ViewController.swift
//  Canvas
//
//  Created by Liem Ly Quan on 11/2/16.
//  Copyright © 2016 coderschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trayOriginalCenter = trayView.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTrayPanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        
        let point = panGestureRecognizer.location(in: self.view)
        let translation = panGestureRecognizer.translation(in: self.view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.began {
            print("Gesture began at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.ended {
            print("Gesture ended at: \(point)")
        }
    }

}

