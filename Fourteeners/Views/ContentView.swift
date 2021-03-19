//
//  ContentView.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/13/21.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) private var context
	@EnvironmentObject var modelData: ModelData
	
    var body: some View {
		ListView()
			.environment(\.managedObjectContext, self.context)
			.environmentObject(modelData)
		
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
