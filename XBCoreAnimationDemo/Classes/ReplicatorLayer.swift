//
//  ReplicatorLayer.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ReplicatorLayer: UIViewController {

    /// 容器View
    private lazy var containerView: UIView = {
        let temView = UIView()
        temView.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        temView.center = self.view.center
        return temView
    }()
    
    private lazy var anchorView: ReflectionView = {
        let image = UIImage(named: "Anchor")
        let temReflectionView = ReflectionView(frame: CGRect(x: 100, y: 100, width: image!.size.width, height: image!.size.height))
        
        let imageView = UIImageView(image: image)
        imageView.bounds = temReflectionView.bounds
        temReflectionView.addSubview(imageView)
        return temReflectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        //view.addSubview(containerView)
        view.addSubview(anchorView)
        
        
        let replicator = CAReplicatorLayer()
        replicator.frame  = containerView.bounds
        containerView.layer.addSublayer(replicator)

        replicator.instanceCount = 10
        
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, 200, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi / 5.0), 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -200, 0)
        replicator.instanceTransform = transform
        
        replicator.instanceBlueOffset = -0.1
        replicator.instanceGreenOffset = -0.1
        
        
        let layer = CALayer()
        layer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        layer.backgroundColor = UIColor.white.cgColor
        replicator.addSublayer(layer)
    }

}


/// MARK - ReflectionView
final class ReflectionView: UIView {
    
    override class var layerClass: AnyClass {
        return CAReplicatorLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        let layer = self.layer as! CAReplicatorLayer
        layer.instanceCount = 2

        var transform = CATransform3DIdentity
        let verticalOffset = bounds.size.height + 2
        transform = CATransform3DTranslate(transform, 0, verticalOffset, 0)
        transform = CATransform3DScale(transform, 1, -1, 0)
        layer.instanceTransform = transform
        layer.instanceAlphaOffset = -0.6;
    }
    
}
