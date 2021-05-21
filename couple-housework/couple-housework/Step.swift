//
//  Step.swift
//  couple-housework
//
//  Created by 姜　さん宇 on 2020/01/19.
//

import Foundation
import UIKit

class Step: Codable {
    let recipe_id: Int?
    let step_number: Int?
    let step_detail: String?
    
    init(recipe_id: Int, step_number: Int, step_detail: String) {
        self.recipe_id = recipe_id
        self.step_number = step_number
        self.step_detail = step_detail
    }
}
