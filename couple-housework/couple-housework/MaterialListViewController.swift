//
//  MaterialListViewController.swift
//  
//
//  Created by 姜　さん宇 on 2020/01/18.
//

import UIKit

class MaterialListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var selected_recipe_id:String = String(UserDefaults.standard.integer(forKey: "selected_recipe_id"))
    
    @IBOutlet weak var tableView: UITableView!
    
    var materials: [Material] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJason()
    }
    func downloadJason(){
        let req_url = URL(string:"https://couple-housework-server.herokuapp.com/api/food_material?recipe_id=\(self.selected_recipe_id)")
//        let req_url = URL(string:"http://127.0.0.1:8000/api/food_material?recipe_id=\(self.selected_recipe_id)")
        guard let downloadURL = req_url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, URLResponse, error in
            
            guard let data = data, error == nil, URLResponse != nil else {
                print("something is wrong")
                return
            }
            do {
                let decoder = JSONDecoder()
                let downloadedMaterials = try decoder.decode([Material].self, from: data)
                self.materials = downloadedMaterials
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("something wrong after downloaded")
            }
        }.resume()
    }
    // delete swipeの実装
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
       self.materials.remove(at: indexPath.row)
       tableView.deleteRows(at: [indexPath], with: .fade)
    }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialCell") as? MaterialCell else {return UITableViewCell()}
        cell.MaterialName.text = materials[indexPath.row].material_name
        cell.Quantity.text = materials[indexPath.row].quantity
        cell.Unit.text = materials[indexPath.row].unit
   
      let full_url = "https://couple-housework-server.herokuapp.com"+materials[indexPath.row].material_image!
        
        if let imageURL = URL(string: full_url) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.MaterialImage.image = image
                    }
                }
            }
        }
        
        return cell
    }
}
