//
//  EmitterLayer.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/4.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class EmitterLayer: UIViewController {

    /// 容器View
    private lazy var containerView: UIView = {
        let temView = UIView()
        temView.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        temView.center = self.view.center
        return temView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        view.addSubview(containerView)
        
        
        let emitter = CAEmitterLayer()
        emitter.frame = containerView.bounds
        containerView.layer.addSublayer(emitter)
        
        emitter.renderMode = .additive
        emitter.emitterPosition = CGPoint(x: emitter.frame.size.width / 2.0,
                                          y: emitter.frame.size.height / 2.0)
        
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: "Spark")?.cgImage
        cell.birthRate = 150
        cell.lifetime = 5.0
        cell.color = UIColor(red: 1, green: 0.5, blue: 0.2, alpha: 1.0).cgColor
        cell.alphaSpeed = -0.4
        cell.velocity = 50
        cell.velocityRange = 50
        cell.emissionRange = CGFloat(Double.pi * 2.0)
        emitter.emitterCells = [cell]
    }

}
