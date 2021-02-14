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
			HStack {
				Text("Mount Bross")
					.font(.title)
					.offset(x: 180)
			
				Text("Mosquito Range, Colorado")
					.font(.subheadline)
					.foregroundColor(.secondary)
					.offset(y: 25)
			}
			
			Divider()
			
			
			}
		}
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView()
    }
}
