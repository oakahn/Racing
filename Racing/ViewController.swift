//
//  ViewController.swift
//  Racing
//
//  Created by Chayawat Suntornrak on 27/6/2562 BE.
//  Copyright © 2562 Chayawat Suntornrak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var carImg: UIImageView!
    
    var listPosition: [CGFloat]?
    
    var timer = Timer()
    var second = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(carImg)
        
        
        let left = UITapGestureRecognizer(target: self, action: #selector(updateValueForLeft))
        leftView.addGestureRecognizer(left)
        
        let center = UITapGestureRecognizer(target: self, action: #selector(updateValueForCenter))
        centerView.addGestureRecognizer(center)
        
        let right = UITapGestureRecognizer(target: self, action: #selector(updateValueForRight))
        rightView.addGestureRecognizer(right)
        
        updateValueForCenter()
        
        setupPosition()
        
        runTimer()
    }
    
    @objc func updateValueForLeft() {
        UIView.animate(withDuration: 0.5) {
            print(self.leftView.center.x)
            self.carImg.transform = CGAffineTransform(translationX: CGFloat(Double(self.leftView.center.x)) - 75/2, y: 0)
        }
    }
    
    @objc func updateValueForCenter() {
        UIView.animate(withDuration: 0.5) {
            print(self.centerView.center.x)
            self.carImg.transform = CGAffineTransform(translationX: CGFloat(Double(self.centerView.center.x)) - 75/2, y: 0)
        }
    }
    
    @objc func updateValueForRight() {
        UIView.animate(withDuration: 0.5) {
            print(self.rightView.center.x)
            self.carImg.transform = CGAffineTransform(translationX: CGFloat(Double(self.rightView.center.x)) - 75/2, y: 0)
        }
    }
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        second -= 1
        getBot()
    }
    
    func getBot() {
        let number1 = Int.random(in: 0 ... 2)
        randomBot(position: listPosition?[number1] ?? CGFloat())
        
        let number3 = Int.random(in: 0 ... 2)
        randomBot(position: listPosition?[number3] ?? CGFloat())
        
        if second == 0 {
            let number2 = Int.random(in: 0 ... 2)
            randomBot(position: listPosition?[number2] ?? CGFloat())
        }
    }
}

extension ViewController {
    
    func setupPosition() {
        listPosition = [CGFloat(Double(self.leftView.center.x)) - 75/2,
                        CGFloat(Double(self.centerView.center.x)) - 75/2,
                        CGFloat(Double(self.rightView.center.x)) - 75/2]
    }
    
    func randomBot(position: CGFloat) {
        second = 1
        let image = UIImage(named: "carBot")
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: position, y: 0, width: 75, height: 75)
        view.addSubview(imageView)
        
        botRun(image: imageView, x: position)
        
        //        imageView.removeFromSuperview()
    }
    
    private func botRun(image: UIImageView, x: CGFloat) {
        //        UIView.animate(withDuration: 2.5, delay: 0.0, options: [], animations:) {
        //            print(x, self.view.frame.height)
        //            image.transform = CGAffineTransform(translationX: x, y: self.view.frame.height)
        //        }, completion: { (finished: Bool) in
        //            self.isOpen = true
        //        })
        
        print(x, self.view.frame.height)
        UIView.animate(withDuration: 1, delay: 0.0, options: [], animations: {
            print(x, self.view.frame.height)
            image.transform = CGAffineTransform(translationX: x, y: self.view.frame.height)
        }, completion: { (finished: Bool) in
            image.removeFromSuperview()
        })
        
        
    }
}
