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
	private var mountainDBs: FetchedResults<MountainDB>
	
	var mountains: [Mountain] {
		for mountain in mountainDBs {
			modelData.mountains[Int(mountain.id)].isBookmarked = mountain.isFavorited
			modelData.mountains[Int(mountain.id)].hasClimbed = mountain.isClimbed
		}
		
		do {
			try context.save()
		} catch {
			print("Could not save \(error.localizedDescription)")
		}
		return modelData.mountains
	}
	
	
	var body: some View {
		NavigationView {
			List {
				ForEach(mountains) { mountain in
									NavigationLink(destination: SingleView(mountain: mountain)) {
											ListElement(mountain: mountain).environment(\.managedObjectContext, self.context)
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
			.environmentObject(ModelData()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
