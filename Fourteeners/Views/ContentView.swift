//
//  ContentView.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		SingleView(mountain: ModelData().mountains[21])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
