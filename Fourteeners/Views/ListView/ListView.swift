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
	@State private var showFavoritesOnly = false
	
	var filteredMountains: [Mountain] {
		modelData.mountains.filter { landmark in
				(!showFavoritesOnly)
			}
		}
	
	var body: some View {
		NavigationView {
			List {
				ForEach(filteredMountains) { mountain in
					NavigationLink(destination: SingleView(mountain: mountain)) {
							ListElement(mountain: mountain)
						}
				}
			}
			.navigationTitle("Mountains")
		}
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
			.environmentObject(ModelData())
    }
}
