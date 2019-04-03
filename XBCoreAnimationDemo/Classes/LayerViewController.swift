//
//  LayerViewController.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit


/// MARK - LayerViewController
class LayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        blueLayer.backgroundColor  = UIColor.blue.cgColor
        view.layer.addSublayer(blueLayer)
        
        
        let redLayer = CALayer()
        redLayer.frame = CGRect(x: 10, y: 20, width: 50, height: 50)
        redLayer.backgroundColor  = UIColor.red.cgColor
        blueLayer.addSublayer(redLayer)
    }

}
