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
	//get the variable
	@EnvironmentObject var modelData: ModelData
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
			
				VStack(alignment: .leading) {
					Text("About " + mountain.peak)
						.font(.title3)
				
					Text(mountain.Description)
						.foregroundColor(.secondary)
						
				}.padding(.all)
			
			
			}
		}
		.navigationTitle(mountain.peak)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView(mountain: ModelData().mountains[22])
			.environmentObject(ModelData())
    }
}
