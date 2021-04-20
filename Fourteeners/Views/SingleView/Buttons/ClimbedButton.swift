//
//  ClimbedButton.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct ClimbedButton: View {
	@Binding var isSet: Bool
	
	var body: some View {
		Button(action: {
					isSet.toggle()
				}) {
					Image(systemName: isSet ? "person.fill.checkmark" : "person.fill.xmark")
						.foregroundColor(isSet ? Color.accentColor : Color.gray)
		}
	}
}

struct ClimbedButton_Previews: PreviewProvider {
	static var previews: some View {
		ClimbedButton(isSet: .constant(true))
	}
}

