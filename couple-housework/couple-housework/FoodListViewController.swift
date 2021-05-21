//
//  FoodListViewController.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/05.
//

import UIKit

class FoodListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var crVC:CookingRecommendViewController!
    
    @IBOutlet weak var shareButton: UIButton!
    
    // 本番
    final let req_url = URL(string:"https://couple-housework-server.herokuapp.com/api/food_recommend/")
    // local
//    final let req_url = URL(string:"http://127.0.0.1:8000/api/food_recommend/")
    var foods: [Food] = []
     
    @IBOutlet weak var tableView: UITableView!
    var cookingRecommendViewController: CookingRecommendViewController!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            downloadJason()
            crVC = (storyboard?.instantiateViewController(withIdentifier: "CookingRecommendViewController"))! as! CookingRecommendViewController
            shareButton.isEnabled = false
            shareButton.isHidden = true
            shareButton.layer.cornerRadius = 20.0
            }

        //URLのresoponse Jsonをtableに入れる
        func downloadJason(){
            guard let downloadURL = req_url else { return }
            URLSession.shared.dataTask(with: downloadURL) { data, URLResponse, error in
                
                guard let data = data, error == nil, URLResponse != nil else {
                    print("something is wrong")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let downloadedFoods = try decoder.decode([Food].self, from: data)
                    self.foods = downloadedFoods
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("something wrong after downloaded")
                }
            }.resume()
        }
        //delete swipeの実装
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           self.foods.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .fade)
            if foods.count == 1{
                shareButton.isEnabled = true
                shareButton.isHidden = false
            }
            if foods.count == 0{
                loadView()
                viewDidLoad()
            }
        }
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return foods.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as? FoodCell else {return UITableViewCell()}
            let intCalorie = foods[indexPath.row].recipe_calorie as? Int ?? 0
            let intTime = foods[indexPath.row].recipe_time as? Int ?? 0
            cell.FoodNameLabel.text = foods[indexPath.row].recipe_name
            cell.FoodCalorieLabel.text = String(intCalorie)+" kcal"
            cell.FoodTimeLabel.text = String(intTime)+" 分"
            if let imageURL = URL(string: foods[indexPath.row].recipe_image!) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.FoodImageView.image = image
                        }
                    }
                }
            }
            
            return cell
        }
    // ①セグエ実行前処理
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // ②Segueの識別子確認
           if segue.identifier == "toMaterialViewController" {

                var recipeId = foods[0].recipe_id
            // ③遷移先ViewCntrollerの取得
                let nextView = segue.destination as! MaterialViewController
            // ④値の設定
                UserDefaults.standard.set(recipeId, forKey: "selected_recipe_id")

           }
       }
    }

