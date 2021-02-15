//
//  MapBlock.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI
import MapKit

struct MapBlock: View {
	var coordinate: CLLocationCoordinate2D
	
	@State private var region = MKCoordinateRegion(
		center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
		span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
	)
	
	var body: some View {
		Map(coordinateRegion: $region)
			.onAppear {
				setRegion(coordinate)
			}
	}
	
	private func setRegion(_ coordinate: CLLocationCoordinate2D) {
			region = MKCoordinateRegion(
				center: coordinate,
				span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
			)
		}
}

struct MapBlock_Previews: PreviewProvider {
	static var previews: some View {
		MapBlock(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
	}
}
