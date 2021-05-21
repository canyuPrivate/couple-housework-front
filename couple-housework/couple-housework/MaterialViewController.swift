//
//  MaterialViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/18.
//

import UIKit

class MaterialViewController: UIViewController {
    
    @IBOutlet weak var shoppingFinishedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shoppingFinishedButton.layer.cornerRadius = 20.0
    }

}
