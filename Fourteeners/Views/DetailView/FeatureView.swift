//
//  FeatureView.swift
//  Fourteeners
//
//  Created by Cooper Eisman on 2/21/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct FeatureView: View {
	@EnvironmentObject var modelData: ModelData
	
	var image: Image
	var name: String
	var info: String
	
	
    var body: some View {
		
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FeatureView_Previews: PreviewProvider {
	
    static var previews: some View {
		
		
		FeatureView(image: Image("Denali"), name: "Denali", info: "Of Alaska Peaks")
    }
}
