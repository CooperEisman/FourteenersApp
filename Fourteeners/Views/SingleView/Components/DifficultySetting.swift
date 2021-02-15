//
//  DifficultySetting.swift
//  Fourteeners
//
//  Created by devbuild on 2/15/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct DifficultySetting: View {
	var difficulty: Int
	
	var level: String {
		if difficulty > -1 && difficulty < 3 {
			return "Beginner"
		} else if difficulty > 2 && difficulty < 5 {
			return "Intermediate"
		} else if difficulty > 4 && difficulty < 7 {
			return "Technical"
		} else if difficulty > 6 && difficulty < 9 {
			return "Expert"
		} else {
			return "Extreme"
		}
	}
	var backround: String {
		if difficulty > -1 && difficulty < 3 {
			return "Green"
		} else if difficulty > 2 && difficulty < 5 {
			return "Yellow"
		} else if difficulty > 4 && difficulty < 7 {
			return "Orange"
		} else if difficulty > 6 && difficulty < 9 {
			return "Red"
		} else {
			return "Black"
		}
	}
	
    var body: some View {
	
		
		
		ZStack {
		Image(backround)
			.resizable()
			.frame(height: 50)
		Text("Climb Type: " + level)
			.font(.title3)
			.bold()
			.foregroundColor(.white)
		}
    }
}

struct DifficultySetting_Previews: PreviewProvider {
    static var previews: some View {
		DifficultySetting(difficulty: 6)
    }
}
