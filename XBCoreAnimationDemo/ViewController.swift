//
//  ViewController.swift
//  XBCoreAnimationDemo
//
//  Created by xiaobin liu on 2019/4/3.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit


/// MARK - CoreAnimation
final class ViewController: UITableViewController {

    /// 数据
    private lazy var array = ["图层",
                              "寄宿图",
                              "图层几何学",
                              "CAShapeLayer",
                              "CATextLayer",
                              "CATransformLayer",
                              "CAGradientLayer",
                              "CAReplicatorLayer",
                              "CAScrollLayer",
                              "CATiledLayer",
                              "CAEmitterLayer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Core Animation"
        view.backgroundColor = UIColor.white
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }

    /// MARK - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.textLabel?.text = array[indexPath.row]
        return cell!
    }
    
    /// MARK - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var vc: UIViewController!
        switch indexPath.row {
        case 0:
            vc = LayerViewController()
        case 1:
            vc = LayerContentsViewController()
        case 2:
            vc = Geometry()
        case 3:
            vc = ShapeLayer()
        case 4:
            vc = TextLayer()
        case 5:
            vc = TransformLayer()
        case 6:
            vc = GradientLayer()
        case 7:
            vc = ReplicatorLayer()
        case 8:
            vc = ScrollLayer()
        case 9:
            vc = TiledLayer()
        case 10:
            vc = EmitterLayer()
        default:
            break
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

