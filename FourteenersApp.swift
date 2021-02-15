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
	
	
	var body: some Scene {
		
		WindowGroup {
			ContentView()
				.environmentObject(modelData)
		}
		
	}
	
}
