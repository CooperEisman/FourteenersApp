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
		VStack{
			ZStack {
				MapBlock(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
					.frame(height: 315.0)
					.ignoresSafeArea(edges: .top)
				
				CircleImage(image: Image("Bross"))
					.offset(x: -80, y: 110)
					.padding(.top, -100)
				
				Text("Mount Bross")
					.offset(x: 90, y: 130)
					.font(.title)
				
				Text("Mosquito Range, Colorado")
					.offset(x: 70, y: 155)
					.font(.subheadline)
					.foregroundColor(.secondary)
			}
			.padding(.bottom)
			Divider()
			
			
			Spacer()
		}
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView()
    }
}
