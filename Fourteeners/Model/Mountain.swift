//
//  Mountain.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Mountain: Hashable, Codable, Identifiable {
	var id: Int
	var peak: String
	var elevationFeet: Int
	var elevationMeters: Int
	var range: String
	var state: String
	var latitude: Double
	var longitude: Double
	var isFeatured: Bool
	var isBookmarked: Bool
	var hasClimbed: Bool
	var imageName: String
	var Description: String
	
	var image: Image {
		Image(imageName)
	}
	
	private var coordinates: Coordinates
	var locationCoordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(
			latitude: latitude,
			longitude: longitude
		)
	}
	
	struct Coordinates: Hashable, Codable {
		var latitude: Double
		var longitude: Double
	}
	
}
