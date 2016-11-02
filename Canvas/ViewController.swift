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
    var originTray: Bool!
    let constDown: CGFloat = 150
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trayOriginalCenter = trayView.center
        originTray = true
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
//            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.ended {
            if panGestureRecognizer.velocity(in: self.view).y > 0 && originTray {
                UIView.animate(withDuration: 0.5, animations: {
                    self.trayView.frame.origin = CGPoint(x: self.trayView.frame.origin.x, y: self.trayView.frame.origin.y + self.constDown)
                    self.originTray = false
                })
                
                
            } else {
                if panGestureRecognizer.velocity(in: self.view).y < 0 && originTray == false {
                UIView.animate(withDuration: 0.5, animations: {
                    self.trayView.frame.origin = CGPoint(x: self.trayView.frame.origin.x, y: self.trayView.frame.origin.y - self.constDown)
                    self.originTray = true
                })
            }
            }
            }
        

    }
    

}

