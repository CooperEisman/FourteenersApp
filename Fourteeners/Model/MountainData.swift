//
//  MountainData.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/24/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import Foundation

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

struct MountainData: Hashable, Codable, Identifiable {
	var id: Int
	var peak: String
	var elevationFeet: Int
	var elevationMeters: Double
	var range: String
	var state: String
	var latitude: Double
	var longitude: Double
	var imageName: String
	var difficulty: Int
	
	
	var about: String
	var history: String
	var trail: String
	
	var image: Image {
		Image(imageName)
	}
	
}
