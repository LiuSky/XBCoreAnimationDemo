//
//  GradientLayer.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class GradientLayer: UIViewController {

    /// 容器View
    private lazy var containerView: UIView = {
        let temView = UIView()
        temView.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        temView.center = self.view.center
        return temView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        view.addSubview(containerView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = containerView.bounds
        containerView.layer.addSublayer(gradientLayer)
        
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor]
        gradientLayer.locations = [0.0, 0.25, 0.5]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
}
