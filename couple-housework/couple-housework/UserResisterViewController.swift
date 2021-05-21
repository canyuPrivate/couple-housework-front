//
//  ViewController.swift
//  couple-housework
//
//  Created by aa247288 on 2019/11/04.
//

import UIKit

class UserResisterViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userDefaults = UserDefaults.standard
        
//        if let value = userDefaults.string(forKey:"text"){
//            userName.text = value
//        }
    }
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        //データが空の場合は画面推移しない
//        if userName.text == ""{
//            return false
//        }
//        //trueを返したときだけ画面遷移する
//        return true
//    }
    
    @IBAction func addUser(_ sender: Any) {
        let device_id = UIDevice.current.identifierForVendor!.uuidString
        let user_id = device_id
        let partner_id = "no data"
        let user_name = userName.text!
        let partner_name = "no data"
        
        postUser(userId: user_id, partnerId: partner_id, userName: user_name, partnerName: partner_name)
        
    }
    

//    @IBAction func tapResisterButton(for segue: UIStoryboardSegue, _ sender: Any) {
//        let userDefaults = UserDefaults.standard
//
//        userDefaults.set(userName.text, forKey: "text")
//        userDefaults.synchronize()
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nextView = segue.destination as! PartnerResisterViewController
//
//        nextView.argString = userName.text!
//
//    }
    struct UserJson: Codable {
        let user_id: String?
        let partner_id: String?
        let user_name: String?
        let partner_name: String?
    }
    func postUser(userId : String, partnerId : String, userName : String, partnerName : String){
        guard let req_url = URL(string:"http://127.0.0.1:8000/api/user/") else {
            return
        }
        var req = URLRequest(url: req_url)
        req.httpMethod = "POST"
//        var jsonObject = Dictionary<String,Any>()
//        jsonObject["user_id"] = userId
//        jsonObject["partner_id"] = partnerId
//        jsonObject["user_name"] = userName
//        jsonObject["partner_name"] = partnerName
//        print(jsonObject)
        let postString = "user_id=\(userId)&partner_id=\(partnerId)&user_name=\(userName)&partner_name=\(partnerName)";
//        print(postString)
//        let jsonString: String = "{\"user_id\":\"\(userId)\", \"partner_id\":\"\(partnerId)\",\"user_name\":\"\(userName)\",\"partner_name\":\"\(partnerName)\"}"
//        print(jsonString)
        req.httpBody = postString.data(using: String.Encoding.utf8);
//           do{
//                req.httpBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
//            }catch{
//                print(error.localizedDescription)
//            }
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
    }
    
}

