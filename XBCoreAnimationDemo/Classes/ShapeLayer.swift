//
//  ShapeLayer.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//  专用图层

import UIKit

class ShapeLayer: UIViewController {

    /// 容器View
    private lazy var containerView: UIView = {
        let temView = UIView()
        temView.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        temView.center = self.view.center
        return temView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(containerView)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 175, y: 100))
        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: CGFloat(2.0 * Double.pi), clockwise: true)
        path.move(to: CGPoint(x: 150, y: 125))
        path.addLine(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 125, y: 225))
        path.move(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 175, y: 225))
        path.move(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 200, y: 150))
        
        //create shape layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
        shapeLayer.path = path.cgPath
        containerView.layer.addSublayer(shapeLayer)
    }
}
