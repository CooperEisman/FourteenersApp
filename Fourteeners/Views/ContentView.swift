//
//  ContentView.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/13/21.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var modelData: ModelData
	var mountain: Mountain
	
	var landmarkIndex: Int {
			modelData.mountains.firstIndex(where: { $0.id == mountain.id })!
		}
	
    var body: some View {
		Text(mountain.peak)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mountain: ModelData().mountains[0])
    }
}
