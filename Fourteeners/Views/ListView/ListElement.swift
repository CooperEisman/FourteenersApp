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
			CircleImage(image: mountain.image, width:65)
			Text(mountain.peak)
			
			Spacer()
			
			if mountain.isBookmarked {
				Image(systemName: "bookmark.fill")
					.foregroundColor(.accentColor)
			}
			if mountain.hasClimbed {
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
			ListElement(mountain: mountains[0])
			ListElement(mountain: mountains[1])
		}
		.previewLayout(.fixed(width: 300, height: 70))
	}
}
