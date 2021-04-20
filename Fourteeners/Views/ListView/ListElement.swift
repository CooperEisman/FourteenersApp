//
//  ListElement.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct ListElement: View {
	var mountain: MountainData
	@Environment(\.managedObjectContext) private var context
	@FetchRequest(entity: MountainDB.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \MountainDB.id, ascending: true)])
	private var result: FetchedResults<MountainDB>
	
	
	
	
	var body: some View {
		HStack {
			if result.contains(where: MountainDB.ID == mountain.id) mountain.id {
			}
			
			
			CircleImage(image: Image(mountain.imageName ?? "none"), width:65)
			Text(mountain.peak)
			
			Spacer()
			
			if mountain.ModelData {
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
