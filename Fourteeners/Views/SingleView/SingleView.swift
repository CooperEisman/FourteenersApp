//
//  SingleView.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI
import MapKit

struct SingleView: View {
	@Environment(\.managedObjectContext) private var context
	@EnvironmentObject var modelData: ModelData
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \MountainDB.id, ascending: true)],
		animation: .default)
	private var mountainDBs: FetchedResults<MountainDB>
	
	var mountain: Mountain
		var mountainIndex: Int {
				modelData.mountains.firstIndex(where: { $0.id == mountain.id })!
	}
	
	
	
	
	
		
		//Start View
    var body: some View {
		ScrollView {
					VStack{
						ZStack {
							MapBlock(coordinate: CLLocationCoordinate2D(latitude: 	mountain.longitude, longitude: mountain.latitude))
									.frame(height: 315.0)
									.ignoresSafeArea(edges: .top)
							
							HStack {
								CircleImage(image: mountain.image, width: 150)
									.padding(.leading, 5.0)
								
								Spacer()
							}.offset(y: 160).padding(.top, -100)
							
						}
					HStack {
						Spacer()
					VStack {
						HStack {
							Text(mountain.peak)
							.font(.title3)
						
						BookmarkButton(isSet: $modelData.mountains[mountainIndex].isBookmarked)
							
						ClimbedButton(isSet: $modelData.mountains[mountainIndex].hasClimbed)
						}
					
						Text(mountain.range + ", " + mountain.state)
							.font(.subheadline)
							.foregroundColor(.secondary)
					}
					}.padding([.top, .trailing], 15.0)
					
					Divider()
					
					HStack {
						
						Text(String(mountain.elevationFeet) + " ft")
							.font(.headline)
							.foregroundColor(.secondary)
						Text(String(mountain.elevationMeters) + " m")
							.font(.headline)
							.foregroundColor(.secondary)
						Text(String(mountain.longitude) + "ºN")
							.font(.headline)
							.foregroundColor(.secondary)
						Text(String(mountain.latitude) + "ºW")
							.font(.headline)
							.foregroundColor(.secondary)
							
					}
					
					Divider()
						
						DifficultySetting(difficulty: mountain.difficulty)
					Divider()
					
						VStack(alignment: .leading) {DisclosureGroup("About " + mountain.peak) {
							Text(mountain.about)
								.foregroundColor(.secondary)
						}.font(.title3).animation(.easeInOut)
						
						DisclosureGroup("History of " + mountain.peak) {
							Text(mountain.history)
								.foregroundColor(.secondary)
						}.font(.title3).animation(.easeInOut)
						
						DisclosureGroup("Trail Info") {
							Text(mountain.trail)
								.foregroundColor(.secondary)
						}.font(.title3).animation(.easeInOut)
							
						
							
								
						}.padding(.all).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
					
					
					}
				}
				.navigationTitle(mountain.peak)
				.navigationBarTitleDisplayMode(.inline)
	}
}


struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView(mountain: ModelData().mountains[54])
			.environmentObject(ModelData())
    }
}

