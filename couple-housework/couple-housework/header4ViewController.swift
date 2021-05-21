//
//  header4ViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/25.
//

import UIKit

class header4ViewController: UIViewController {
    @IBOutlet weak var image4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image4.layer.cornerRadius = image4.frame.size.height/2
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
