//
//  ContentView.swift
//  Deserts
//
//  Created by Chip Chairez on 8/6/24.
//

import SwiftUI

struct DesertsView: View {
    @State private var viewModel = DesertsViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: viewModel.columns){
                    ForEach(viewModel.meals, id: \.id) { mealPreview in
                        NavigationLink(){
                            MealView(viewModel: MealViewModel(mealPreview: mealPreview))
                        }label: {
                            MealPreviewView(mealPreview: mealPreview)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .transition(.opacity)
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Deserts")
        }
        .task {
            await viewModel.getMeals()
        }
    }
}

#Preview {
    DesertsView()
}
