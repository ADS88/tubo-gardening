import SwiftUI
import PhotosUI
import Foundation

struct AddPlantView: View {
    @State private var plantName: String = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    
    var body: some View {
        VStack{
            Form {
                         
                                TextField("Plant Name", text: $plantName)
                                
                                PhotosPicker(
                                    selection: $selectedItem,
                                    matching: .images
                                ) {
                                    HStack {
                                        Label("Select a Photo", systemImage: "photo")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .onChange(of: selectedItem) { newItem in
                                    Task {
                                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                                           let uiImage = UIImage(data: data) {
                                            selectedImage = Image(uiImage: uiImage)
                                        }
                                    }
                                }
                                
                                if let image = selectedImage {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                }
                            }
              
                        
        }.navigationTitle("Add Plant")
            .safeAreaInset(edge: .bottom){
                Button("Submit") {
                // Perform action here
                    print("Form submitted")
                }.buttonStyle(.borderedProminent)
                    .disabled(plantName.isEmpty || selectedImage == nil)
            }
    }
}

