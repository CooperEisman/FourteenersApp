//
//  BoxedImage.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct BoxedImage: View {
	var body: some View {
		ZStack {
			Image("Bross")
			Text("Mt. Bross")
				.bold()
				.font(.largeTitle)
				.offset(x: 0, y: 150)
		}
		
	}
}

struct BoxedImage_Previews: PreviewProvider {
	static var previews: some View {
		BoxedImage()
	}
}
