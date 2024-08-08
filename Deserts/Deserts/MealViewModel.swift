//
//  MealViewModel.swift
//  Deserts
//
//  Created by Chip Chairez on 8/7/24.
//

import Foundation

struct MealResponse: Codable {
    var meals: [Meal]
}

@Observable
class MealViewModel {
    var mealPreview: MealPreview
    var meal: Meal?
    
    init(mealPreview: MealPreview) {
        self.mealPreview = mealPreview
    }
    
    func getMeal() async {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealPreview.id)") else {
            fatalError("Invalid meal URL")
        }

        do {
            guard let (data, response) = try? await URLSession.shared.data(from: url) else {
                throw APIError.connection
            }
            
            guard let response = response as? HTTPURLResponse else {
                    throw APIError.server
            }
            
            switch response.statusCode {
                case 400..<500: throw APIError.client
                case 500..<600: throw APIError.server
                default: break
            }
            
            if let response = try? JSONDecoder().decode(MealResponse.self, from: data){
                meal = response.meals[0]
            }else {
                throw APIError.data
            }
        }
        catch APIError.connection {
            await getMeal()
        }
        catch APIError.client {
            fatalError("Client error")
        }
        catch APIError.server {
            fatalError("Server error")
        }
        catch APIError.data {
            fatalError("Invalid data")
        }
        catch{
            fatalError("Error")
        }
    }
}
