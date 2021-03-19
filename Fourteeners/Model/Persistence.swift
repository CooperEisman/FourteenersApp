//
//  Persistence.swift
//  PeaksIOS
//
//  Created by Cooper Eisman on 2/24/21.
//
import CoreData

struct PersistenceController {
	//Create the COntainer and Controller
	static let shared = PersistenceController()
	let container: NSPersistentCloudKitContainer

	init() {
		//Create and Load Persistentce. Return error if doesn't exist
		container = NSPersistentCloudKitContainer(name: "MountainsDB")
		
		//Create Local
		let localStoreLocation = URL(fileURLWithPath: "/path/to/local.store")
			let localStoreDescription =
				NSPersistentStoreDescription(url: localStoreLocation)
			localStoreDescription.configuration = "Local"
		
		// Create a store description for a CloudKit-backed local store
		   let cloudStoreLocation = URL(fileURLWithPath: "/path/to/cloud.store")
		   let cloudStoreDescription =
			   NSPersistentStoreDescription(url: cloudStoreLocation)
		   cloudStoreDescription.configuration = "Cloud"
		
		
		// Set the container options on the cloud store
		cloudStoreDescription.cloudKitContainerOptions =
			NSPersistentCloudKitContainerOptions(
				containerIdentifier: "com.eismanprojects.peaks")
		
		// Update the container's list of store descriptions
		container.persistentStoreDescriptions = [
			cloudStoreDescription,
			localStoreDescription
		]
		
		//Load
		container.loadPersistentStores(completionHandler: {
					(storeDescription, error) in
					if let error = error as NSError? {
						fatalError("Unresolved error \(error), \(error.userInfo)")
					}
		})
	
	}
}
