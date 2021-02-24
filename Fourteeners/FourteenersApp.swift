//
//  FourteenersApp.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/13/21.
//
import SwiftUI

@main
struct FourteenersApp: App {
	
	let persistenceController = PersistenceController.shared
	
	@StateObject private var modelData = ModelData()
	
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(modelData)
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
			
		}
		
	}
	
}
