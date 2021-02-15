//
//  ListView.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct ListView: View {
	@EnvironmentObject var modelData: ModelData
	@State private var showBookMarkedOnly = false
	@State private var showClimbedOnly = false
	@State var doFilterState = false
	@State var filterState = "Colorado"
		
	var filteredMountainsOne: [Mountain] {
		modelData.mountains.filter { mountain in
			(!showClimbedOnly || mountain.hasClimbed)
			}
		}
	var filteredMountainsTwo: [Mountain] {
		filteredMountainsOne.filter { mountain in
			(!showBookMarkedOnly || mountain.isBookmarked)
			}
		}
	var filteredMountains: [Mountain] {
		filteredMountainsTwo.filter { mountain in
			(!doFilterState || mountain.state == filterState)
			}
		}
	
	
	var body: some View {
		NavigationView {
			List {
				NavigationLink("Filter Settings", destination: ListFilterView(doFilterStates: $doFilterState, filterClimbed: $showClimbedOnly, filterBookmarked: $showBookMarkedOnly, whatState: $filterState)).font(.title3)
				ForEach(filteredMountains) { mountain in
					NavigationLink(destination: SingleView(mountain: mountain)) {
							ListElement(mountain: mountain)
						}
				}
			}
			.navigationTitle("14-Ers List")
		}
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
			.environmentObject(ModelData())
    }
}
