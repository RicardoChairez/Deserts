//
//  MealPreviewView.swift
//  Deserts
//
//  Created by Chip Chairez on 8/6/24.
//

import SwiftUI
import Kingfisher

struct MealPreviewView: View {
    let mealPreview: MealPreview
    
    var body: some View {
        VStack(spacing: 8){
            mealPreview.image
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .clipped()
                
            Text(mealPreview.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 175)
        .background(.card)
        .cornerRadius(20)
        .shadow(color: Color(.black.opacity(0.2)), radius: 4)
        .padding(.vertical, 8)
    }
}

#Preview {
    MealPreviewView(mealPreview: MealPreview(name: "Banana Pancakes", id: "1", imageURLString: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg"))
}
