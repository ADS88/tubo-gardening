import SwiftUI
import Foundation

struct AddPlantCardView: View {
    var body: some View {
        VStack {
            Text("Add Plant")
                .font(.headline)
                .padding(4)
           
               
            Image(systemName: "plus.circle.fill")
                .foregroundStyle(.blue)
                .font(.headline)
            
        } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [10, 5]))
                        .foregroundColor(.blue)
                )
    }
}


#Preview(traits: .fixedLayout(width: 600, height: 600)) {
    AddPlantCardView().padding(16)
}
