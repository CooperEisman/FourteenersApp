
//  Persistence.swift
//  PromptAware
//
//  Created by Cooper Eisman on 4/19/21.
//

import CoreData

struct PersistenceController {
	static let shared = PersistenceController()

	static var preview: PersistenceController = {
		let result = PersistenceController(inMemory: true)
		let viewContext = result.container.viewContext
		
		var num = 0
		
		for _ in 0..<10 {
			let newMountain = MountainDB(context: viewContext)
			newMountain.id = Int64(num)
			newMountain.isClimbed = true
			newMountain.isFavorited = false
			
			num = num + 1
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
		container = NSPersistentCloudKitContainer(name: "PeaksApp")
		if inMemory {
			container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
		}
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if (error as NSError?) != nil {
				print("Error in loading stores")
			}
		})
	}
}
