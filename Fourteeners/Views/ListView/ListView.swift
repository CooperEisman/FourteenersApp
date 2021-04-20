//
//  ListView.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct ListView: View {
	@Environment(\.managedObjectContext) private var context
	@EnvironmentObject var modelData: ModelData
	
	
	
	
	var body: some View {
		NavigationView {
			List {
				ForEach(modelData.mountains) { _ in MountainData
					NavigationLink(destination: SingleView(mountain: MountainData)) {
							ListElement(mountain: MountainData).environment(\.managedObjectContext, self.context)
						}
				}
			} .navigationTitle("All Mountains")
			  .navigationBarTitleDisplayMode(.inline)
		}.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
			.environmentObject(ModelData())
    }
}
