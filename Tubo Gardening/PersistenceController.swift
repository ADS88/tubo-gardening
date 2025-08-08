import CoreData

class PersistenceController: ObservableObject {
    let container = NSPersistentContainer(name: "Tubo")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store failed: \(error.localizedDescription)")
            }
        }
    }
}
