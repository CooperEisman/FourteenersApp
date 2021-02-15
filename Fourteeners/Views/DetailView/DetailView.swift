//
//  DetailView.swift
//  Fourteeners
//
//  Created by devbuild on 2/15/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct DetailView: View {
	@EnvironmentObject var modelData: ModelData
	
	var featuredMountains: [Mountain] {
		modelData.mountains.filter { mountain in
			(mountain.isFeatured)
			}
		}
	
    var body: some View {
		VStack {
			HStack {
				Image(featuredMountains[0].imageName)
				Image(featuredMountains[0].imageName)
			}
			
		}
}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView()
			.environmentObject(ModelData())
	}
}
