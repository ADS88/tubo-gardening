import SwiftUI
import Foundation

struct PlantCardView: View {
    let plant: PlantPreview
    var body: some View {
        VStack(alignment: .leading) {
            Image(plant.image)
                .resizable()
                .scaledToFit()
                    
            Text(plant.name)
                        .font(.headline)
                        .padding(8)
                }
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}


#Preview(traits: .fixedLayout(width: 600, height: 600)) {
    let plant = PlantPreview( id: UUID(), name: "Chilli", image: "chilli")
    PlantCardView(plant: plant).padding(16)
}

