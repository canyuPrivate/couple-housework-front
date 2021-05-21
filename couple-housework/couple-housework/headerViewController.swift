//
//  headerViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/25.
//

import UIKit

class headerViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        image.layer.cornerRadius = image.frame.size.height/2

    }
    }
