//
//  ViewController.swift
//  Day12_1
//
//  Created by Chinh Ng on 19/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let circle = UIView()
    
    var timer1: Timer!
    var timer2: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(circle)
        circle.frame = .init(x: 0, y: 0, width: 60, height: 60)
        circle.backgroundColor = .systemBlue
        circle.layer.cornerRadius = 32
        
        run()
    }
    
    func run() {
        let scale = view.frame.width / view.frame.height
        
        timer1 = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            self.circle.frame.origin.x += 0.1
            self.circle.frame.origin.y = self.circle.frame.origin.x / scale
            print("\(self.circle.frame.origin.x) - \(self.view.frame.maxX)")
            if self.circle.frame.origin.x > self.view.frame.maxX {
                self.timer1.invalidate()
                self.timer2 = Timer(timeInterval: 0.001, repeats: true, block: { _ in
                    self.circle.frame.origin.x -= 0.1
                    self.circle.frame.origin.y = self.circle.frame.origin.x / scale
                    if self.circle.frame.origin.x < self.view.frame.minX {
                        self.timer2.invalidate()
                        self.run()
                    }
                })
            }
        })
    }

}

