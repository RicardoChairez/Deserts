//
//  Meal.swift
//  Deserts
//
//  Created by Chip Chairez on 8/7/24.
//

import Foundation

struct Meal: Codable {
    private var strInstructions: String
    private var strIngredient1: String?
    private var strIngredient2: String?
    private var strIngredient3: String?
    private var strIngredient4: String?
    private var strIngredient5: String?
    private var strIngredient6: String?
    private var strIngredient7: String?
    private var strIngredient8: String?
    private var strIngredient9: String?
    private var strIngredient10: String?
    private var strIngredient11: String?
    private var strIngredient12: String?
    private var strIngredient13: String?
    private var strIngredient14: String?
    private var strIngredient15: String?
    private var strIngredient16: String?
    private var strIngredient17: String?
    private var strIngredient18: String?
    private var strIngredient19: String?
    private var strIngredient20: String?
    private var strMeasure1: String?
    private var strMeasure2: String?
    private var strMeasure3: String?
    private var strMeasure4: String?
    private var strMeasure5: String?
    private var strMeasure6: String?
    private var strMeasure7: String?
    private var strMeasure8: String?
    private var strMeasure9: String?
    private var strMeasure10: String?
    private var strMeasure11: String?
    private var strMeasure12: String?
    private var strMeasure13: String?
    private var strMeasure14: String?
    private var strMeasure15: String?
    private var strMeasure16: String?
    private var strMeasure17: String?
    private var strMeasure18: String?
    private var strMeasure19: String?
    private var strMeasure20: String?
    
    var intructions: [String]{strInstructions.components(separatedBy: "\n").filter{!$0.isEmpty && $0 != "\r"}}
    var ingredients: [(name: String, measurement: String)]{
        [
            (strIngredient1, strMeasure1),
            (strIngredient2, strMeasure2),
            (strIngredient3, strMeasure3),
            (strIngredient4, strMeasure4),
            (strIngredient5, strMeasure5),
            (strIngredient6, strMeasure6),
            (strIngredient7, strMeasure7),
            (strIngredient8, strMeasure8),
            (strIngredient9, strMeasure9),
            (strIngredient10, strMeasure10),
            (strIngredient11, strMeasure11),
            (strIngredient12, strMeasure12),
            (strIngredient13, strMeasure13),
            (strIngredient14, strMeasure14),
            (strIngredient15, strMeasure15),
            (strIngredient16, strMeasure16),
            (strIngredient17, strMeasure17),
            (strIngredient18, strMeasure18),
            (strIngredient19, strMeasure19),
            (strIngredient20, strMeasure20)
        ].map({($0.0 ?? "", $0.1 ?? "")}).filter({!$0.name.isEmpty && !$0.measurement.isEmpty})
    }
}
