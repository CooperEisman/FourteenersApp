//
//  Persistence.swift
//  PeaksIOS
//
//  Created by Cooper Eisman on 2/24/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
		
		var modelData: [MountainData] {return load("FourteenersData.json")}
		
		
		var curr = 0
		
		for _ in 0..<modelData.count {
			var newItem = Mountain(context: viewContext)
			
			newItem.name = modelData[curr].peak
			newItem.aboutText = modelData[curr].about
			newItem.difficulty = (Int16)(modelData[curr].difficulty)
			newItem.elevationFeet = (Int16)(modelData[curr].elevationFeet)
			newItem.elevationMeters = (Int16)(modelData[curr].elevationMeters)
			newItem.historyText = modelData[curr].history
			newItem.imageName = modelData[curr].imageName
			newItem.isClimbed = modelData[curr].hasClimbed
			newItem.isFavorited = modelData[curr].isBookmarked
			newItem.isFeatured = false
			newItem.latitude = modelData[curr].latitude
			newItem.longitude = modelData[curr].longitude
			newItem.rangeName = modelData[curr].range
			newItem.stateName = modelData[curr].state
			newItem.trailText = modelData[curr].trail
			
			newItem.id = UUID()
            
			curr += 1
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Fourteeners")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }

}
