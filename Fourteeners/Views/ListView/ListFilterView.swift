//
//  ListFilterView.swift
//  Fourteeners
//
//  Created by devbuild on 2/15/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct ListFilterView: View {
	@Binding var doFilterStates: Bool
	@Binding var filterClimbed: Bool
	@Binding var filterBookmarked: Bool
	@Binding var whatState: String
	
    var body: some View {
		ScrollView {
			Toggle(isOn: $filterBookmarked) {
				Text("Filter by Bookmarked:")
			}.padding()
			
			Toggle(isOn: $filterClimbed) {
				Text("Filter by Climbed")
			}
			.padding()
			Toggle(isOn: $doFilterStates) {
				Text("Filter by State")
			}.padding()
			if doFilterStates {
				Picker(selection: $whatState, label: Text("State: ")) {
					Text("Colorado").tag("Colorado")
					Text("Washington").tag("Washington")
				}
			}
			
			
		}
		.navigationTitle("Filter Settings")
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct ListFilterView_Previews: PreviewProvider {
    static var previews: some View {
		ListFilterView(doFilterStates: .constant(true), filterClimbed: .constant(true), filterBookmarked: .constant(true), whatState: .constant("Colorado"))
    }
}
