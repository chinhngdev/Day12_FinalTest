//
//  ViewController.swift
//  Day12_3
//
//  Created by Chinh Ng on 19/04/2022.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var searchCV3: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    var timer: Timer!
    let line = UIBezierPath()
    let layer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.cornerRadius = 16
        subView.layer.cornerRadius = 12
        searchCV3.layer.cornerRadius = 22
    }
    
    func drawLineWith(button: UIButton) {

        line.move(to: CGPoint(x:button.frame.minX, y:button.frame.maxY + 5))
        line.addLine(to: CGPoint(x: button.frame.maxX, y: button.frame.maxY + 5))
        line.addLine(to: CGPoint(x: button.frame.maxX, y: button.frame.maxY + 7.5))
        line.addLine(to: CGPoint(x: button.frame.minX, y: button.frame.maxY + 7.5))

        layer.path = line.cgPath
        layer.fillColor = UIColor.gray.cgColor
        layer.opacity = 0.7
        
        subView.layer.addSublayer(layer)
    }
    
    func time() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { _ in
//            self.layer.removeFromSuperlayer()
            self.line.removeAllPoints()
        })
    }

    @IBAction func staysTapped(_ sender: UIButton) {
        drawLineWith(button: sender)
        time()
    }
    
    @IBAction func flightsTapped(_ sender: UIButton) {
        drawLineWith(button: sender)
        time()
    }
    
    @IBAction func carsTapped(_ sender: UIButton) {
        drawLineWith(button: sender)
        time()
    }
    
    @IBAction func thingsToDoTapped(_ sender: UIButton) {
        drawLineWith(button: sender)
        time()
    }
}

