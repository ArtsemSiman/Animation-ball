//
//  ViewController.swift
//  Animation of the ball
//
//  Created by Артём Симан on 14.03.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var top: NSLayoutConstraint!
    
    @IBOutlet weak var left: NSLayoutConstraint!
    
    @IBOutlet weak var right: NSLayoutConstraint!
    
    @IBOutlet weak var down: NSLayoutConstraint!
    
    @IBOutlet weak var ball: UIImageView!
  
    @IBOutlet weak var start: UIButton!
    
  
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start.addTarget(self, action: #selector(moving), for: .touchUpInside)
    }

    
    
    @objc
    private func moving() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.right.constant -= 350
            self.view.layoutIfNeeded()
        }, completion: {_ in
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.down.constant -= 150
            self.view.layoutIfNeeded()
        } , completion: {_ in
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.left.constant -= 350
            self.view.layoutIfNeeded()
        } , completion: {_ in
            UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.top.constant += 150
            self.view.layoutIfNeeded()
            }
        )}
        )}
        )}
        )}
    
}
