//
//  CircleImage.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
	var image: Image
	var width: CGFloat
	
	var body: some View {
		image
			.resizable()
			.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
			.overlay(Circle().stroke(Color.white, lineWidth: 4))
			.shadow(radius: 7)
			.frame(width: width, height: width)
	}
}

struct CircleImage_Previews: PreviewProvider {
	static var previews: some View {
		CircleImage(image: Image("null"), width: 200)
	}
}
