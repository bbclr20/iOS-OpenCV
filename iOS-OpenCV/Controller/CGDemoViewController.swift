//
//  CGDemoViewController.swift
//  iOS-OpenCV
//
//  Created by ben on 2019/3/19.
//  Copyright © 2019 ben. All rights reserved.
//

import UIKit

class CGDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        let view = DrawView()
        view.backgroundColor = .white
        
        self.view = view
    }
    
}

