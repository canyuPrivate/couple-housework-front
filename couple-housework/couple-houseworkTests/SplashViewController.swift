//
//  SplashViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/04.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.chooseShouldLaunchViewController()
    }
    fileprivate func chooseShouldLaunchViewController() {
        if UserDefaults.standard.shouldDisplayTutorial() {
            // 初回起動
            launchTutorial()
        } else {
            // ２回目以降
            launchHome()
        }
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
