//
//  ContentView.swift
//  Tubo Gardening
//
//  Created by Andrew Sturman on 8/8/2025.
//

import SwiftUI

let defaults = UserDefaults.standard

struct ContentView: View {
    
    // Make a new fetch request with no sorting
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var plants: FetchedResults<Plant>
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    NavigationLink(destination: AddPlantView()) {
                        AddPlantCardView()
                    }
                    ForEach(plants) {plant in
                        let uiImage: UIImage = {
                            if let data = plant.image, let img = UIImage(data: data) {
                                return img
                            } else {
                                return UIImage(named: "chilli")!
                            }
                        }()
                        let plantPreview: PlantPreview = PlantPreview(
                            id: plant.id ?? UUID(),
                            name: plant.name ?? "",
                            image: uiImage
                        )
                        NavigationLink(destination: PlantDetailView(plant: plantPreview)) {
                            PlantCardView(plant: plantPreview)
                        }
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image("tubo-logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Tubo")
                                .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
