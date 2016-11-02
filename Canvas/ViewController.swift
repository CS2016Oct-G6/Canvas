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
    @IBOutlet weak var deadImageView: UIImageView!
    @IBOutlet weak var excitedImageView: UIImageView!
    @IBOutlet weak var happyImageView: UIImageView!
    @IBOutlet weak var sadImageView: UIImageView!
    @IBOutlet weak var tongueImageView: UIImageView!
    @IBOutlet weak var winkImageView: UIImageView!
    var trayOriginalCenter: CGPoint!
    var newlyCreatedFace: UIImageView!

    var originTray: Bool!
    let constDown: CGFloat = 150
    
    
    
    var initialFaceCenter: CGPoint = CGPoint()

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
    
    @IBAction func imagePanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
        // Gesture recognizers know the view they are attached to
        if panGestureRecognizer.state == .began {
        let imageView = panGestureRecognizer.view as! UIImageView
        
        // Create a new image view that has the same image as the one currently panning
        newlyCreatedFace = UIImageView(image: imageView.image)
        
        // Add the new face to the tray's parent view.
        view.addSubview(newlyCreatedFace)
        
        // Initialize the position of the new face.
        newlyCreatedFace.center = imageView.center
        
        // Since the original face is in the tray, but the new face is in the
        // main view, you have to offset the coordinates
        newlyCreatedFace.center.y += trayView.frame.origin.y
        initialFaceCenter = newlyCreatedFace.center
        
        } else if panGestureRecognizer.state == .changed {
            let translation = panGestureRecognizer.translation(in: self.view)

            newlyCreatedFace.center = CGPoint(
                x: initialFaceCenter.x + translation.x,
                y: initialFaceCenter.y + translation.y
            )
        }
        
        
    }
    
    
    
    
    
    func setPan(){
        
    }

}

