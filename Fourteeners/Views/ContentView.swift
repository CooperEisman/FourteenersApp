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
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \MountainDB.id, ascending: true)],
		animation: .default)
	private var mountainDBs: FetchedResults<MountainDB>
	
	
	
	
    var body: some View {
		ListView()
			.environment(\.managedObjectContext, self.context)
			.environmentObject(modelData)
			.onChange(of: modelData.mountains, perform: { value in
				print("Change Valies")
				updateStack(MountainStack: mountainDBs)
			})
		
    }
	private func updateStack(MountainStack: FetchedResults<MountainDB>) {
		
		var numRuns = 0
		
		if (MountainStack.endIndex == 0) {
			print("Filling Empty Array")
			for mountain in modelData.mountains {
				print("Creating Item")
				let newMountain = MountainDB(context: context)
				newMountain.id = Int64(numRuns)
				newMountain.isClimbed = mountain.hasClimbed
				newMountain.isFavorited = mountain.isBookmarked
				
				numRuns = numRuns + 1
				
				do {
					try context.save()
					print("Saved Successfully")
				} catch {
					print("Error Saving Stack")
				}
			}
		} else {
			print("updating array")
			for mountain in MountainStack {
				mountain.isClimbed = modelData.mountains[Int(mountain.id)].hasClimbed
				mountain.isFavorited = modelData.mountains[Int(mountain.id)].isBookmarked
			}
		}
		
			do {
				try context.save()
			} catch {
				print("Error Saving Stack")
			}
		
		print("Done with Function")
		
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
