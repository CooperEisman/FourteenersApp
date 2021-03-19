//
//  ListView.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct ListView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@EnvironmentObject var modelData: ModelData
	@State private var showBookMarkedOnly = false
	@State private var showClimbedOnly = false
	@State var doFilterState = false
	@State var filterState = "Colorado"
	@State var doSort = false
	@State var sortBy = "Alpha"
		
	var filteredMountainsOne: [Mountain] {
		modelData.mountains.filter { mountain in
			(!showClimbedOnly || mountain.hasClimbed)
			}
		}
	var filteredMountainsTwo: [Mountain] {
		filteredMountainsOne.filter { mountain in
			(!showBookMarkedOnly || mountain.isFavorited)
			}
		}
	var filteredMountainsThree: [Mountain] {
		filteredMountainsTwo.filter { mountain in
			(!doFilterState || mountain.stateName == filterState)
			}
		}
	
	var filteredMountains: [Mountain] {
		if(doSort) { if(sortBy == "Alpha") { return filteredMountainsThree.sorted(by: { $1.name > $0.name })
			
		} else if (sortBy == "AlphaRev") {
			return filteredMountainsThree.sorted(by: { $0.peak > $1.peak })
		
		} else if (sortBy == "Peak") {
			return filteredMountainsThree.sorted(by: { $0.elevationFeet > $1.elevationFeet })
		} else if (sortBy == "PeakRev") {
			return filteredMountainsThree.sorted(by: { $1.elevationFeet > $0.elevationFeet })
		}
	}
	return filteredMountainsThree
	}
	
	var body: some View {
		NavigationView {
			List {
				NavigationLink("Filter Settings", destination: ListFilterView(doFilterStates: $doFilterState, filterClimbed: $showClimbedOnly, filterBookmarked: $showBookMarkedOnly, whatState: $filterState, doSort: $doSort, sortBy: $sortBy)).font(.title3)
				
				ForEach(filteredMountains) { mountain in
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
