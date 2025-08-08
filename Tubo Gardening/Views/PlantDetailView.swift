import SwiftUI

struct PlantDetailView: View {
    let plant: PlantPreview
    var body: some View {
        VStack {
            Text(plant.name)
            Image(uiImage: plant.image)
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .clipped()
        }
      
    }
}
