//
//  Material.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/18.
//

import Foundation
import UIKit

class Material: Codable {
    let recipe_id: Int?
    let material_id: Int?
    let quantity: String?
    let unit: String?
    let material_name: String?
    let material_image: String?
    
    
    
    init(recipe_id: Int, material_id: Int, quantity: String, unit: String, material_name: String, material_image: String) {

        self.recipe_id = recipe_id
        self.material_id = material_id
        self.quantity = quantity
        self.unit = unit
        self.material_name = material_name
        self.material_image = material_image
    }
}

