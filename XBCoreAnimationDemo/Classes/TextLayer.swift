//
//  TextLayer.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//  专用图层

import UIKit

class TextLayer: UIViewController {

    /// 标签View
    private lazy var labelView: UIView = {
        let temView = UIView()
        temView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        temView.center = self.view.center
        return temView
    }()
    
    private lazy var customLabel: UILabel = {
        let temLayerLabel = LayerLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        temLayerLabel.center = self.view.center
        temLayerLabel.layer.backgroundColor = UIColor.white.cgColor
        temLayerLabel.textColor = UIColor.red
        temLayerLabel.font = UIFont.systemFont(ofSize: 14)
        temLayerLabel.text = "iOS 6中，Apple给UILabel和其他UIKit文本视图添加了直接的属性化字符串的支持，应该说这是一个很方便的特性。不过事实上从iOS3.2开始CATextLayer就已经支持属性化字符串了。这样的话，如果你想要支持更低版本的iOS系统，CATextLayer无疑是你向界面中增加富文本的好办法，而且也不用去跟复杂的Core Text打交道，也省了用UIWebView的麻烦"
        return temLayerLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
        //view.addSubview(labelView)
        view.addSubview(customLabel)
        
        let textLayer = CATextLayer()
        textLayer.frame = labelView.bounds
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.alignmentMode = .justified
        textLayer.isWrapped = true
        
        let font = UIFont.systemFont(ofSize: 15)
        let text = "iOS 6中，Apple给UILabel和其他UIKit文本视图添加了直接的属性化字符串的支持，应该说这是一个很方便的特性。不过事实上从iOS3.2开始CATextLayer就已经支持属性化字符串了。这样的话，如果你想要支持更低版本的iOS系统，CATextLayer无疑是你向界面中增加富文本的好办法，而且也不用去跟复杂的Core Text打交道，也省了用UIWebView的麻烦"
        
        let string = NSMutableAttributedString(string: text)
        
        let attribs: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.black.cgColor,
                       NSAttributedString.Key.font: font]
        string.setAttributes(attribs, range: NSRange(location: 0, length: text.count))
        
        let linkAttribs: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.red.cgColor,
        NSAttributedString.Key.font: font]
        string.setAttributes(linkAttribs, range: NSRange(location: 0, length: 3))
        textLayer.string = string
        labelView.layer.addSublayer(textLayer)
    }

}




/// MARK - custom
final class LayerLabel: UILabel {
    
    override class var layerClass: AnyClass {
        return CATextLayer.self
    }
    
    private var textLayer: CATextLayer {
        return layer as! CATextLayer
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
//        self.text = self.text
//        textColor = textColor
//        font = font
        textLayer.alignmentMode = .justified
        textLayer.isWrapped = true
        layer.display()
    }
    
    override var text: String? {
        didSet {
             textLayer.string = text
        }
    }
    
    override var textColor: UIColor! {
        didSet {
            textLayer.foregroundColor = textColor.cgColor
        }
    }
    
    override var font: UIFont! {
        didSet {
            textLayer.font = font.fontName as CFTypeRef
            textLayer.fontSize = font.pointSize
        }
    }
}
