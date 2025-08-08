import Foundation
import SwiftUI

struct PlantCardView: View {
    let plant: PlantPreview
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(uiImage: plant.image)
                .resizable()
                .scaledToFit()

            Text(plant.name)
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .background(Color.white)
                .cornerRadius(12)
                .padding(8)
        }

        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 600)) {
    let plant = PlantPreview(id: UUID(), name: "Chilli", image: UIImage(named: "chilli")!)
    PlantCardView(plant: plant).padding(16)
}
