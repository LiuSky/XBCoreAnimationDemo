//
//  LayerContentsViewController.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class LayerContentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        
//        let image = UIImage(named: "Snowman")
//
//        let layerView = CALayer()
//        layerView.backgroundColor = UIColor.red.cgColor
//        layerView.frame = CGRect(x: 100, y: 100, width: image?.size.width ?? 100, height: image?.size.height ?? 200)
//        layerView.contents = image?.cgImage
//        layerView.contentsGravity = .center
//        layerView.contentsScale = UIScreen.main.scale
//        layerView.masksToBounds = true
//        view.layer.addSublayer(layerView)
        
        
        
        
        let image = UIImage(named: "Sprites")
        
        let coneView = CALayer()
        coneView.frame = CGRect(x: 10, y: 100, width: 128, height: 128)
        coneView.contents = image?.cgImage
        coneView.contentsGravity = .resizeAspect
        coneView.contentsRect = CGRect(x: 0, y: 0, width: 0.5, height: 0.5)
        view.layer.addSublayer(coneView)
        
        
        let shipView = CALayer()
        shipView.frame = CGRect(x: coneView.frame.maxX, y: 100, width: 128, height: 128)
        shipView.contents = image?.cgImage
        shipView.contentsGravity = .resizeAspect
        shipView.contentsRect = CGRect(x: 0.5, y: 0, width: 0.5, height: 0.5)
        view.layer.addSublayer(shipView)
        
        
        let iglooView = CALayer()
        iglooView.frame = CGRect(x: 10, y: coneView.frame.maxY, width: 128, height: 128)
        iglooView.contents = image?.cgImage
        iglooView.contentsGravity = .resizeAspect
        iglooView.contentsRect = CGRect(x: 0, y: 0.5, width: 0.5, height: 0.5)
        view.layer.addSublayer(iglooView)
        
        
        let anchorView = CALayer()
        anchorView.frame = CGRect(x: iglooView.frame.maxX, y: coneView.frame.maxY, width: 128, height: 128)
        anchorView.contents = image?.cgImage
        anchorView.contentsGravity = .resizeAspect
        anchorView.contentsRect = CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5)
        view.layer.addSublayer(anchorView)
        
    }

}
