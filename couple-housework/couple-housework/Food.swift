//
//  Food.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/04.
//

import Foundation
import UIKit

class Food: Codable {
//    var image: UIImage
    let recipe_id: Int?
    let recipe_name: String?
    let recipe_image: String?
    let recipe_time: Int?
    let recipe_calorie: Int?
    
    init(recipe_id: Int, recipe_name: String, recipe_image: String, recipe_time: Int, recipe_calorie: Int ) {
//        self.image = image
        self.recipe_id = recipe_id
        self.recipe_name = recipe_name
        self.recipe_image = recipe_image
        self.recipe_time = recipe_time
        self.recipe_calorie = recipe_calorie
        
    }
}
