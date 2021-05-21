//
//  StepListViewController.swift
//  
//
//  Created by 姜　さん宇 on 2020/01/19.
//

import UIKit

class StepListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var selected_recipe_id:String = String(UserDefaults.standard.integer(forKey: "selected_recipe_id"))
    
    @IBOutlet weak var tableView: UITableView!
    
    var steps: [Step] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJason()

        // Do any additional setup after loading the view.
    }
    func downloadJason(){
        let req_url = URL(string:"https://couple-housework-server.herokuapp.com/api/recipe_step?recipe_id=\(self.selected_recipe_id)")
//        let req_url = URL(string:"http://127.0.0.1:8000/api/recipe_step?recipe_id=\(self.selected_recipe_id)")
        guard let downloadURL = req_url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, URLResponse, error in
            
            guard let data = data, error == nil, URLResponse != nil else {
                print("something is wrong")
                return
            }
            do {
                let decoder = JSONDecoder()
                let downloadedMaterials = try decoder.decode([Step].self, from: data)
                self.steps = downloadedMaterials
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("something wrong after downloaded")
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return steps.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeCell else {return UITableViewCell()}
            
            var arrayStepLabel = steps[indexPath.row].step_detail?.components(separatedBy: "。")
            
            var lastArrayStepLabel = arrayStepLabel![arrayStepLabel!.count-1]
            
            if (lastArrayStepLabel == "" || lastArrayStepLabel == " "){
                arrayStepLabel?.removeLast()
            }
            
            // 手順に改行を入れる
            var stepLabelText = arrayStepLabel?.joined(separator: "\n\n")
            
            //labelの行を無制限に
            cell.stepLabel.numberOfLines = 0
            cell.stepLabel.lineBreakMode = .byWordWrapping
            self.tableView.rowHeight = UITableView.automaticDimension
            //labelに角丸をつける
            cell.stepLabel.layer.cornerRadius = 5.0
            cell.stepLabel.clipsToBounds = true
            cell.stepLabel.text = stepLabelText
            
            
            cell.stepNumber.text = "STEP"+String(indexPath.row+1)
            return cell
        }

}
