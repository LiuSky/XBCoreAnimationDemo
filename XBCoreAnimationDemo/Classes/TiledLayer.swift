//
//  TiledLayer.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/4.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class TiledLayer: UIViewController, CALayerDelegate {

    private lazy var scrollView: UIScrollView = {
       let temScrollView = UIScrollView()
        temScrollView.bounds = CGRect(x: 0, y: 0, width: 256, height: 256)
        temScrollView.center = self.view.center
        return temScrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        view.addSubview(scrollView)
        
        let tileLayer = CATiledLayer()
        tileLayer.frame = CGRect(x: 0, y: 0, width: 1024, height: 1024)
        tileLayer.delegate = self
        tileLayer.contentsScale = UIScreen.main.scale
        scrollView.layer.addSublayer(tileLayer)
        
        scrollView.contentSize = tileLayer.frame.size
        tileLayer.setNeedsDisplay()
    }
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        
        let temTileLayer = layer as! CATiledLayer
        let bounds = ctx.boundingBoxOfClipPath
        let x = Int(bounds.origin.x / temTileLayer.tileSize.width * UIScreen.main.scale)
        let y = Int(bounds.origin.y / temTileLayer.tileSize.height * UIScreen.main.scale)
        

        let imageName = "Snowman_0\(x)_0\(y)"
        let tileImage = UIImage(named: imageName)
        UIGraphicsPushContext(ctx)
        tileImage?.draw(in: bounds)
        UIGraphicsPopContext()
    }

}
