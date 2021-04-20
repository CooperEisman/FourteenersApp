//
//  ListView.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct ListView: View {
	//Add Stuff
	@Environment(\.managedObjectContext) private var context
	@EnvironmentObject var modelData: ModelData
	
	//Fetch Saved Data
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \MountainDB.id, ascending: true)],
		animation: .default)
	private var mountainDB: FetchedResults<MountainDB>
	
	
	
	
	
	
	
	
	var body: some View {
		NavigationView {
			List {
				ForEach(modelData.mountains) { mountain in
									NavigationLink(destination: SingleView(mountain: mountain)) {
											ListElement(mountain: mountain)
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
