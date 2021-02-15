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
	var elevationMeters: Double
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
	
}
