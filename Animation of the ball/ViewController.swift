//
//  ViewController.swift
//  Animation of the ball
//
//  Created by Артём Симан on 14.03.22.
//

import UIKit

class ViewController: UIViewController {
    let ballSize: CGFloat = 150
    
    var defaultSpacing: CGFloat = 20

    @IBOutlet weak var top: NSLayoutConstraint!
    
    @IBOutlet weak var left: NSLayoutConstraint!
    
    @IBOutlet weak var ball: UIImageView!
  
    @IBOutlet weak var start: UIButton!
    
  
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start.addTarget(self, action: #selector(moving), for: .touchUpInside)
    }

    
    
    @objc
    private func moving() {
        
        let width = Double(self.view.frame.width) - 2 * defaultSpacing - ballSize
        let height = Double(self.view.frame.height) - 2 * defaultSpacing - ballSize
        
        let horizontalDuration: TimeInterval = 1
        let verticalDuration: TimeInterval = horizontalDuration * height / width
        
        UIView.animate(withDuration: horizontalDuration, delay: 0, options: [.curveLinear], animations: {
            self.left.constant = self.view.frame.width - self.defaultSpacing - self.ballSize
            self.view.layoutIfNeeded()
        }, completion: {_ in
        UIView.animate(withDuration: verticalDuration, delay: 0, options: [.curveLinear], animations: {
            self.top.constant = self.view.frame.height - self.defaultSpacing - self.ballSize
            self.view.layoutIfNeeded()
        } , completion: {_ in
        UIView.animate(withDuration: horizontalDuration, delay: 0, options: [.curveLinear], animations: {
            self.left.constant = self.defaultSpacing
            self.view.layoutIfNeeded()
        } , completion: {_ in
            UIView.animate(withDuration: verticalDuration, delay: 0, options: [.curveLinear], animations: {
            self.top.constant = self.defaultSpacing
            self.view.layoutIfNeeded()
            },completion: { _ in
                self.moving()
            })
        })
    })
})
    }
}
