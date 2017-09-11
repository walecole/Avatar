//
//  springAnimation.swift
//  Avatar
//
//  Created by WALE on 05/09/2017.
//  Copyright © 2017 AppSoul. All rights reserved.
//

import UIKit

var delay = 0.0
var duration = 0.7
var damping = 0.7
var velocity = 0.7


public func spring(duration: TimeInterval, animations: (() -> Void)!){
    UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: {
            animations()
    }, completion: {
        finished in
    })
}


public func springWithDelay(duration: TimeInterval, delay: TimeInterval, animations: (() -> Void)!){
    UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
        animations()
    }, completion: {
        finished in
    })
}






