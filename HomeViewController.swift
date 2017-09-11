//
//  HomeViewController.swift
//  Avatar
//
//  Created by WALE on 28/08/2017.
//  Copyright © 2017 AppSoul. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var popOverView: UIView!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var headerVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var maskButton: UIButton!
    @IBOutlet weak var shareLabelsView: UIView!
    @IBOutlet var panRecognizer: UIPanGestureRecognizer!
    
    //UIDynamics
    var animator: UIDynamicAnimator!
    var attachmentBehaviour: UIAttachmentBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var snapBehaviour: UISnapBehavior!
    
    
    @IBAction func likeButton(_ sender: Any) {
        
    }
    
    @IBAction func userButton(_ sender: Any) {
        popOverView.isHidden = false
        let scale = CGAffineTransform(scaleX: 0.3, y: 0.3)
        let translate = CGAffineTransform(translationX: 50,y: -50 )
        
        popOverView.transform = scale.concatenating(translate)
        popOverView.alpha = 0
        maskButton.isHidden = false
        
        spring(duration: 0.5){
            let scale = CGAffineTransform(scaleX: 1, y: 1)
            let translate = CGAffineTransform(translationX: 0,y: 0 )
            self.popOverView.transform = scale.concatenating(translate)
            self.popOverView.alpha = 1
        }
        
    }
    
    func hidePopoverView(){
        spring(duration: 0.5){
           self.popOverView.isHidden = true
        }
    }
    
    @IBAction func imageButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.7, animations: { 
            self.dialogView.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            self.imageButton.frame = CGRect(x: 0, y: 0, width: 375, height: 250)
            self.likeButton.alpha = 0
            self.shareButton.alpha = 0
            self.userButton.alpha = 0
            self.headerVisualEffectView.isHidden = true
            self.dialogView.layer.cornerRadius = 0
            self.imageButton.layer.cornerRadius = 0
        }, completion: { finished in
            self.performSegue(withIdentifier: "homeToDetail", sender: self)
        })
    }
    
    @IBAction func maskButton(_ sender: Any) {
        self.maskButton.isHidden = true
        hideShareView()
        hidePopoverView()
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        shareView.isHidden = false
        maskButton.isHidden = false
        shareView.transform = CGAffineTransform(translationX:0, y: 200)
        emailButton.transform = CGAffineTransform(translationX:0, y: 200)
        twitterButton.transform = CGAffineTransform(translationX:0, y:200)
        facebookButton.transform = CGAffineTransform(translationX:0, y: 200)
        shareLabelsView.alpha = 0
        
        spring(duration: 0.5){
            self.shareView.transform = CGAffineTransform(translationX:0, y: 0)
            self.dialogView.transform = CGAffineTransform(scaleX:0.8 , y:0.8)
        }
        
        springWithDelay(duration: 0.5, delay: 0.05, animations: {
            self.emailButton.transform = CGAffineTransform(translationX:0, y: 0)
        })
        springWithDelay(duration: 0.5, delay: 0.10, animations: {
            self.twitterButton.transform = CGAffineTransform(translationX:0, y: 0)
        })
        springWithDelay(duration: 0.5, delay: 0.15, animations: {
            self.facebookButton.transform = CGAffineTransform(translationX:0, y: 0)
        })
        springWithDelay(duration: 0.5, delay: 0.20, animations: {
            self.shareLabelsView.alpha = 1
        })
        
    }
    
    func hideShareView(){
        spring(duration: 0.5){
            self.shareView.transform = CGAffineTransform(translationX:0, y: 0)
            self.dialogView.transform = CGAffineTransform(scaleX:1 , y:1 )
            self.shareView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let translate = CGAffineTransform(translationX: 0,y: -200 )
        
        dialogView.transform = scale.concatenating(translate)
        
        spring(duration: 0.5){
            let scale = CGAffineTransform(scaleX: 1, y: 1)
            let translate = CGAffineTransform(translationX: 0,y: 0 )
            self.dialogView.transform = scale.concatenating(translate)
        }
        
        animator = UIDynamicAnimator(referenceView: view)
    }

    @IBAction func handleGesture(recognizer:UIPanGestureRecognizer) {
        let myView = dialogView
        let boxLocation = recognizer.location(in: dialogView)
        let location = recognizer.location(in: view)
        if recognizer.state == UIGestureRecognizerState.began {
            if snapBehaviour != nil{
                animator.removeBehavior(snapBehaviour)
            }
            let centerOffset = UIOffsetMake(boxLocation.x - (myView?.bounds.midX)!, boxLocation.y - (myView?.bounds.midY)!)
            attachmentBehaviour = UIAttachmentBehavior(item: myView!, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBehaviour.frequency = 0
            animator.addBehavior(attachmentBehaviour)
        } else if recognizer.state == UIGestureRecognizerState.changed {
            attachmentBehaviour.anchorPoint = location
            
        } else if recognizer.state == UIGestureRecognizerState.ended {
            animator.removeBehavior(attachmentBehaviour)
            snapBehaviour = UISnapBehavior(item: myView!, snapTo: view.center)
            animator.addBehavior(snapBehaviour)
            
            let translation = recognizer.translation(in: view)
            if translation.y > 100 {
                animator.removeAllBehaviors()
                let gravity = UIGravityBehavior(items: [dialogView])
                gravity.gravityDirection = CGVector(dx: 0, dy: 10)
                animator.addBehavior(gravity)
         }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}


