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
			// Replace this implementation with code to handle the error appropriately.
			// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
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
