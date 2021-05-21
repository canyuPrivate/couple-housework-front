//
//  UserUpdateViewControllerr.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2019/12/28.
//

import UIKit

class UserUpdateViewControllerr: UIViewController {
    var user_id = UIDevice.current.identifierForVendor!.uuidString
    var partner_id = ""
    var user_name = ""
    var partner_name = ""
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var partnerId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ユーザー編集"
        getUser(userId: user_id)
        // Do any additional setup after loading the view.
    }
    struct UserJson: Codable {
        let user_id: String?
        let partner_id: String?
        let user_name: String?
        let partner_name: String?
    }
    func getUser(userId : String){
        guard let req_url = URL(string:"http://127.0.0.1:8000/api/user/\(userId)/") else {
            return
        }
        var req = URLRequest(url: req_url)
        req.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    do {
                        let decoder = JSONDecoder()
                        let json = try decoder.decode(UserJson.self, from: data)
                        self.user_id = json.user_id!
                        self.partner_id = json.partner_id!
                        let user_name = json.user_name!
                        self.partner_name = json.partner_name!
                        let partner_id = json.partner_id!
                        
                        DispatchQueue.main.async {
                            self.userName.text = user_name
                            if partner_id != "no data"{
                                self.partnerId.text = partner_id
                            }
                        }
                    } catch {
                        print("エラーが出ました")
                    }
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
    }
    
    func deleteUser(userId : String){
        guard let req_url = URL(string:"http://127.0.0.1:8000/api/user/\(userId)/") else {
            return
        }
        var req = URLRequest(url: req_url)
        req.httpMethod = "DELETE"
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
    func putUser(userId : String, partnerId : String, userName : String, partnerName : String){
            guard let req_url = URL(string:"http://127.0.0.1:8000/api/user/\(userId)/") else {
                return
            }
            var req = URLRequest(url: req_url)
            req.httpMethod = "PUT"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(userId, forKey: "user_id")
        jsonDictionary.setValue(partnerId, forKey: "partner_id")
        jsonDictionary.setValue(userName, forKey: "user_name")
        jsonDictionary.setValue(partnerName, forKey: "partner_name")
        let jsonData: Data
        do {
            jsonData = try JSONSerialization.data (withJSONObject: jsonDictionary)
            req.httpBody = jsonData
        }catch{
            print("error to create json")
            return
        }
        
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
    func updateFunction(user_id: String, partner_id: String,user_name: String){
            guard let req_url = URL(string:"http://127.0.0.1:8000/api/user/\(partner_id)/") else {
                return
            }
            var req = URLRequest(url: req_url)
            req.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: req) { (data, response, error) in

                    // Check for Error
                    if let error = error {
                        print("Error took place \(error)")
                        return
                    }

                    // Convert HTTP Response Data to a String
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        do {
                            let decoder = JSONDecoder()
                            let json = try decoder.decode(UserJson.self, from: data)
                            
                                let partner_name = json.user_name!
                                self.putUser(userId: user_id, partnerId: partner_id, userName: user_name, partnerName: partner_name)
                                self.putUser(userId: partner_id, partnerId: user_id, userName: partner_name, partnerName: user_name)
                        } catch {
                            print("エラーが出ました")
                        }
                        print("Response data string:\n \(dataString)")
                    }
            }
            task.resume()
    }
    @IBAction func updateUser(_ sender: Any) {
        let user_id = self.user_id
        let partner_id = partnerId.text!
        let user_name = userName.text!
        self.updateFunction(user_id: user_id, partner_id: partner_id, user_name: user_name)
}
}
