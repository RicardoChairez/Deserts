//
//  MealPreview.swift
//  Deserts
//
//  Created by Chip Chairez on 8/7/24.
//

import Foundation
import Kingfisher
import SwiftUI

struct MealPreview: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case id = "idMeal"
        case imageURLString = "strMealThumb"
    }
    
    var name: String
    var id: String
    var imageURLString: String
    
    var image: KFImage{
        KFImage(URL(string: imageURLString))
            .fade(duration: 0.5)
            .placeholder{
                ProgressView()
            }
    }
}
