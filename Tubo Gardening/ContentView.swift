//
//  ContentView.swift
//  Tubo Gardening
//
//  Created by Andrew Sturman on 8/8/2025.
//

import SwiftUI

struct ContentView: View {
    let plants: [PlantPreview] = [
        PlantPreview(id: UUID(), name: "Sunflower", image: "chilli"),
        PlantPreview(id: UUID(), name: "Chilli", image: "chilli"),
        PlantPreview(id: UUID(), name: "Basil", image: "chilli"),
        PlantPreview(id: UUID(), name: "Sunflower", image: "chilli"),
        PlantPreview(id: UUID(), name: "Sunflower", image: "chilli"),
        PlantPreview(id: UUID(), name: "Chilli", image: "chilli"),
        PlantPreview(id: UUID(), name: "Basil", image: "chilli"),
        PlantPreview(id: UUID(), name: "Sunflower", image: "chilli")
    ]
    
   private let columns = [
       GridItem(.flexible()),
       GridItem(.flexible())
   ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(plants) { PlantCardView(plant: $0) }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
