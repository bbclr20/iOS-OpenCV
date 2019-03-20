//
//  Color2GrayViewController.swift
//  iOS-OpenCV
//
//  Created by ben on 2019/3/18.
//  Copyright © 2019 ben. All rights reserved.
//

import UIKit

class Color2GrayViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func changeColor(_ sender: Any) {
        let image = UIImage(named: "candy")
        if counter%2 == 0 {
            imageView.image = OpenCVWrapper.color2Gray(image, alphaExist: false)
        } else {
            imageView.image = image
        }
        counter = counter + 1
    }
    
}
