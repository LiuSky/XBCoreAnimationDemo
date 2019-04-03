//
//  Geometry.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class Geometry: UIViewController {

    /// 背景View
    private lazy var bgView: UIView = {
        let temView = UIView()
        temView.bounds = CGRect(x: 0, y: 0, width: 256, height: 256)
        temView.center = self.view.center
        return temView
    }()
    
    /// 时钟
    private lazy var clockFace: UIImageView = {
        let temView = UIImageView()
        temView.frame = self.bgView.bounds
        temView.image = UIImage(named: "ClockFace")
        return temView
    }()
    
    /// 小时
    private lazy var hourHand: UIImageView  = {
        let temView = UIImageView()
        temView.frame = CGRect(x: 113, y: 81, width: 30, height: 94)
        temView.image = UIImage(named: "HourHand")
        temView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        return temView
    }()
    
    /// 分
    private lazy var minuteHand: UIImageView  = {
        let temView = UIImageView()
        temView.frame = CGRect(x: 118, y: 75, width: 20, height: 106)
        temView.image = UIImage(named: "MinuteHand")
        temView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        return temView
    }()
    
    /// 秒
    private lazy var secondHand: UIImageView  = {
        let temView = UIImageView()
        temView.frame = CGRect(x: 124, y: 77, width: 8, height: 102)
        temView.image = UIImage(named: "SecondHand")
        temView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        return temView
    }()
    
    /// 计时器
    private lazy var timer: Timer = {
        let temTimer = Timer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(tick),
                             userInfo: nil,
                             repeats: true)
        return temTimer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        view.addSubview(bgView)
        bgView.addSubview(clockFace)
        bgView.addSubview(hourHand)
        bgView.addSubview(minuteHand)
        bgView.addSubview(secondHand)
        tick()
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
    }

    @objc private func tick() {
        

        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let components = calendar.dateComponents([.hour, .minute, .second], from: Date())
        
        let hourAngle = (Double(components.hour!) / 12.0) * Double.pi * 2.0
        let minuteAngle = (Double(components.minute!) / 60.0) * Double.pi * 2.0
        let secondAngle = (Double(components.second!) / 60.0) * Double.pi * 2.0
        
        hourHand.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle))
        minuteHand.transform = CGAffineTransform(rotationAngle: CGFloat(minuteAngle))
        secondHand.transform = CGAffineTransform(rotationAngle: CGFloat(secondAngle))
    }
}
