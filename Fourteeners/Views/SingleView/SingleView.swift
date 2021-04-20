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
	
	//get the variable
	var mountain: MountainData
	
	var mountainIndex: UUID {
		mountain.id ?? UUID()
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
						CircleImage(image: Image(mountain.imageName ?? "none"), width: 150)
							.padding(.leading, 5.0)
						
						Spacer()
					}.offset(y: 160).padding(.top, -100)
					
				}
			HStack {
				Spacer()
			VStack {
				HStack {
					Text(mountain.peak ?? "Empty")
					.font(.title3)
				
					BookmarkButton(isSet: (mountain.isFavorited)
					
					ClimbedButton(isSet: mountain.isClimbed)
				}
			
				Text((mountain.rangeName ?? "Empty") + ", " + (mountain.stateName ?? "Empty"))
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
				
				DifficultySetting(difficulty: (Int)(mountain.difficulty))
			Divider()
			
				VStack(alignment: .leading) {DisclosureGroup("About " + (mountain.name ?? "Error")) {
					Text(mountain.aboutText ?? "Error")
						.foregroundColor(.secondary)
				}.font(.title3).animation(.easeInOut)
				
				DisclosureGroup("History of " + (mountain.name ?? "Error")) {
					Text(mountain.historyText ?? "Error")
						.foregroundColor(.secondary)
				}.font(.title3).animation(.easeInOut)
				
				DisclosureGroup("Trail Info") {
					Text(mountain.trailText ?? "Error")
						.foregroundColor(.secondary)
				}.font(.title3).animation(.easeInOut)
					
				
					
						
				}.padding(.all).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
			
			
			}
		}
		.navigationTitle(mountain.name ?? "Error")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView(mountain: ModelData().mountains[54])
			.environmentObject(ModelData())
    }
}
