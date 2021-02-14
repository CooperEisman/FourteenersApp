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
    var body: some View {
		ScrollView {
		VStack{
			ZStack {
				MapBlock(coordinate: CLLocationCoordinate2D(latitude: 	34.011_286, longitude: 	-116.166_868))
						.frame(height: 315.0)
						.ignoresSafeArea(edges: .top)
				
					CircleImage(image: Image("Bross"))
						.offset(x: -80, y: 160)
						.padding(.top, -100)
				
				}
			VStack {
				HStack {
				Text("Mount Bross")
					.font(.title3)
				
				BookmarkButton(isSet: .constant(true))
					
				ClimbedButton(isSet: .constant(true))
				}
			
				Text("Mosquito Range, Colorado")
					.font(.subheadline)
					.foregroundColor(.secondary)
			} .offset(x: 90, y: 10) .padding(.bottom)
			
			Divider()
			
			HStack {
				
				Text("14,178 ft")
					.font(.headline)
					.foregroundColor(.secondary)
				Text("4321.6 m")
					.font(.headline)
					.foregroundColor(.secondary)
				Text("39.3354ºN")
					.font(.headline)
					.foregroundColor(.secondary)
				Text("106.1077ºW")
					.font(.headline)
					.foregroundColor(.secondary)
					
			}
			
			Divider()
			
				VStack(alignment: .leading) {
					Text("About Mount Bross")
						.font(.title3)
				
					Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
						.foregroundColor(.secondary)
						
				}.padding(.all)
			
			
			}
		}
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView()
    }
}
