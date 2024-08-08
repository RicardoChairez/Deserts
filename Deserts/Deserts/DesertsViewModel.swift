//
//  DesertsViewModel.swift
//  Deserts
//
//  Created by Chip Chairez on 8/7/24.
//

import Foundation
import SwiftUI

struct MealPreviewsResponse: Codable {
    var meals: [MealPreview]
}

@Observable
class DesertsViewModel{
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]
    
    var meals: [MealPreview] = []
    
    func getMeals() async {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            fatalError("Invalid desert URL")
        }
        
        do{
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
            
            if let decodedResponse = try? JSONDecoder().decode(MealPreviewsResponse.self, from: data){
                meals = decodedResponse.meals.sorted(by: {$0.name < $1.name})
            }else {
                throw APIError.data
            }
        }
        catch APIError.connection {
            await getMeals()
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
