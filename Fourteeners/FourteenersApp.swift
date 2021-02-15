//
//  FourteenersApp.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/13/21.
//

import SwiftUI

@main
struct FourteenersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(mountain: ModelData().mountains[0])
        }
    }
}
