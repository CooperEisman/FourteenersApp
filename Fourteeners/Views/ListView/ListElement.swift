//
//  ListElement.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct ListElement: View {
	var mountain: Mountain
	
	
	
	var body: some View {
		HStack {
			CircleImage(image: Image(mountain.imageName ?? "none"), width:65)
			Text(mountain.name ?? "Empty")
			
			Spacer()
			
			if mountain.isFavorited {
				Image(systemName: "bookmark.fill")
					.foregroundColor(.accentColor)
			}
			if mountain.isClimbed {
				Image(systemName: "person.fill.checkmark")
					.foregroundColor(.accentColor)
			}
		}
	}
}

struct ListElement_Previews: PreviewProvider {
	static var mountains = ModelData().mountains
	
	static var previews: some View {
		Group {
			///ListElement(mountain: mountains[0])
			///ListElement(mountain: mountains[1])
		}
		.previewLayout(.fixed(width: 300, height: 70))
	}
}
