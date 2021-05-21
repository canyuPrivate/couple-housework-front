//
//  HomeViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2019/12/04.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var RecommendButton: UIButton!
    
    @IBOutlet weak var History: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RecommendButton.layer.cornerRadius = 20.0
        History.layer.cornerRadius = 20.0
    }

}
