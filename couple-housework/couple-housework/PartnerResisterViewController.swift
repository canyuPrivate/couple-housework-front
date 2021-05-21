//
//  PartnerResisterViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2019/11/23.
//

import UIKit

class PartnerResisterViewController: UIViewController {
    var argString = ""
    let deviceId = UIDevice.current.identifierForVendor!.uuidString
//    @IBOutlet weak var labelName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        labelName.text = deviceId
        
        
        // QRコードをNSDataに変換
         let data = deviceId.data(using: String.Encoding.utf8)!
         
        // QRコード生成
        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let qrImage = qr.outputImage!.transformed(by: sizeTransform)
        let context = CIContext()
        let cgImage = context.createCGImage(qrImage, from: qrImage.extent)
        let uiImage = UIImage(cgImage: cgImage!)

        // 作成したQRコードを表示
        let qrImageView = UIImageView()
        qrImageView.contentMode = .scaleAspectFit
        qrImageView.frame = self.view.frame
        qrImageView.image = uiImage
        self.view.addSubview(qrImageView)
        
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
