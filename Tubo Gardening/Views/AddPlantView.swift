import Foundation
import PhotosUI
import SwiftUI


struct AddPlantView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var plantName: String = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    @State private var uiImage: UIImage? = nil

    var body: some View {
        VStack {
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
                        if let data = try? await newItem?.loadTransferable(
                            type: Data.self),
                            let uiImage = UIImage(data: data)
                        {
                            selectedImage = Image(uiImage: uiImage)
                            self.uiImage = uiImage
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
            .safeAreaInset(edge: .bottom) {
                Button("Submit") {
                    // Perform action here
                    print("Form submitted")
                    guard let uiImage else { return }
                    let newPlant = Plant(context: context)
                    newPlant.name = plantName
                    newPlant.createdAt = Date()
                    newPlant.id = UUID()
                    newPlant.image = uiImage.jpegData(compressionQuality: 1.0)
                    do {
                        try context.save()
                        dismiss()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }.buttonStyle(.borderedProminent)
                    .disabled(plantName.isEmpty || selectedImage == nil)
            }
    }
}
