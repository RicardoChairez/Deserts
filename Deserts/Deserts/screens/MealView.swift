//
//  MealView.swift
//  Deserts
//
//  Created by Chip Chairez on 8/6/24.
//

import SwiftUI

struct MealView: View {
    @State var viewModel: MealViewModel
    
    var body: some View {
        ScrollView{
            VStack{
                Text(viewModel.mealPreview.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                viewModel.mealPreview.image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 4)
                    .padding(.vertical, 8)
                
                Divider()
                    .padding(.vertical)
                
                if viewModel.meal != nil {
                    Text("Ingredients")
                        .padding(.bottom)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.meal!.ingredients, id:\.name) { ingredient in
                        Text("\(ingredient.measurement) \(ingredient.name)")
                            .padding(.vertical, 4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text("Preparation")
                        .padding(.bottom)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(0..<viewModel.meal!.intructions.count, id:\.self) { index in
                        VStack{
                            Text("Step \(index + 1)")
                                .padding(.bottom)
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(viewModel.meal!.intructions[index])
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.bottom, 16)
                    }
                }else {
                    ProgressView()
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getMeal()
        }
    }
}

#Preview {
    MealView(viewModel: MealViewModel(mealPreview: MealPreview(name: "Banana Pancakes", id: "1", imageURLString: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg")))
}
