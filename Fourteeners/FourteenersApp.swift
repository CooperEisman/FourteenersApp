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
	
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
			
		}
		
	}
	
}
