//
//  ContentView.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/13/21.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var modelData = ModelData()
	
    var body: some View {
		ListView()
			.environmentObject(ModelData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
