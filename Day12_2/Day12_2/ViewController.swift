//
//  ViewController.swift
//  Day12_2
//
//  Created by Chinh Ng on 19/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let txtField = UITextField()
    let calButton = UIButton()
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(txtField)
        txtField.frame = CGRect(x: 0, y: 300, width: 300, height: 30)
        txtField.center.x = view.center.x
        txtField.placeholder = "Nhập vào một số tự nhiên."
        txtField.textAlignment = .center
        
        view.addSubview(resultLabel)
        resultLabel.frame = CGRect(x: 0, y: txtField.frame.maxY + 110 , width: 200, height: 50)
        resultLabel.center.x = view.center.x
        resultLabel.text = "Result"
        resultLabel.textAlignment = .center
        
        
        view.addSubview(calButton)
        calButton.frame = CGRect(x: 0, y: txtField.frame.maxY + 30, width: 100, height: 50)
        calButton.center.x = view.center.x
        calButton.setTitle("Calculate", for: .normal)
        calButton.setTitleColor(.white, for: .normal)
        calButton.backgroundColor = .systemBlue
        calButton.layer.cornerRadius = 15
        
        calButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
    }

    @objc func calculate() {
        
        let alert = UIAlertController(title: "Alert", message: "Dữ liệu đầu vào không hợp lệ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        var result: Int = 1
        if let input = txtField.text {
            if let inputNumber = Int(input) {
                for i in 1...inputNumber {
                    result *= i
                }
                resultLabel.text = "Result = \(result)"
            } else {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

