//
//  header2ViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/25.
//

import UIKit

class header2ViewController: UIViewController {

    @IBOutlet weak var image2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image2.layer.cornerRadius = image2.frame.size.height/2
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
