//
//  FourteenersApp.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/13/21.
//
import SwiftUI

@main
struct FourteenersApp: App {
	@StateObject private var modelData = ModelData()
	let persistenceController = PersistenceController.shared
	
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
				.environmentObject(modelData)
			
		}
		
	}
	
}
