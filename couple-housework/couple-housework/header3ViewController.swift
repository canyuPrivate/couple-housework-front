//
//  header3ViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/25.
//

import UIKit

class header3ViewController: UIViewController {

    @IBOutlet weak var image3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image3.layer.cornerRadius = image3.frame.size.height/2
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
