//
//  TransformLayer.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class TransformLayer: UIViewController {

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
        
        
        var pt = CATransform3DIdentity
        pt.m34 = -1.0/500.0
        containerView.layer.sublayerTransform = pt
        
        
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, -100, 0, 0)
        let cube1 = cubeWithTrans(form: c1t)
        containerView.layer.addSublayer(cube1)
        
        
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 100, 0, 0)
        c2t = CATransform3DRotate(c2t, -CGFloat(Double.pi/4), 1, 0, 0)
        c2t = CATransform3DRotate(c2t, -CGFloat(Double.pi/4), 0, 1, 0)
        let cube2 = cubeWithTrans(form: c2t)
        containerView.layer.addSublayer(cube2)
    }
    
    private func cubeWithTrans(form transform: CATransform3D) -> CALayer {
        
        let cube = CATransformLayer()
        
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(faceWithTrans(form: ct))
        
        
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi/2), 0, 1, 0)
        cube.addSublayer(faceWithTrans(form: ct))

        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi/2), 1, 0, 0)
        cube.addSublayer(faceWithTrans(form: ct))
        
        
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, -CGFloat(Double.pi/2), 1, 0, 0)
        cube.addSublayer(faceWithTrans(form: ct))

        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, -CGFloat(Double.pi/2), 0, 1, 0)
        cube.addSublayer(faceWithTrans(form: ct))
        
        
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, -CGFloat(Double.pi/2), 0, 1, 0)
        cube.addSublayer(faceWithTrans(form: ct))

        
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi), 0, 1, 0)
        cube.addSublayer(faceWithTrans(form: ct))
        
        let containerSize = containerView.bounds.size
        cube.position = CGPoint(x: containerSize.width/2.0,
                                y: containerSize.height/2.0)

        cube.transform = transform
        return cube
    }
    
    
    private func faceWithTrans(form transform: CATransform3D) -> CALayer {
     
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        
        let red = CGFloat.random(in: 0.0..<255.0)
        let green = CGFloat.random(in: 0.0..<255.0)
        let blue = CGFloat.random(in: 0.0..<255.0)
        face.backgroundColor = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0).cgColor
        face.transform = transform
        return face
    }
}
