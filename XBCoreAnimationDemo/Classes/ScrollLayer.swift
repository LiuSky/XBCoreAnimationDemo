//
//  ScrollLayer.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/4.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ScrollLayer: UIViewController {

    private lazy var scrollView: CustomScrollView = {
        let temView = CustomScrollView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        temView.center = self.view.center
       
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        imageView.image = UIImage(named: "Snowman")
        temView.addSubview(imageView)
        return temView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        view.addSubview(scrollView)
    }
}



//MARK - custom
final class CustomScrollView: UIView {
    
    override class var layerClass: AnyClass {
        return CAScrollLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        layer.masksToBounds = true
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        addGestureRecognizer(recognizer)
    }
    
    @objc private func pan(recognizer: UIPanGestureRecognizer) {
        
        var offset = bounds.origin
        offset.x -= recognizer.translation(in: self).x
        offset.y -= recognizer.translation(in: self).y

        layer.scroll(offset)
        recognizer.setTranslation(CGPoint.zero, in: self)
    }
}
