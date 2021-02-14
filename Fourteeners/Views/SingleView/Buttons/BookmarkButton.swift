//
//  BookmarkButton.swift
//  Fourteeners
//
//  Created by devbuild on 2/14/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct BookmarkButton: View {
	@Binding var isSet: Bool
	
	var body: some View {
		Button(action: {
					isSet.toggle()
				}) {
					Image(systemName: isSet ? "bookmark.fill" : "bookmark")
						.foregroundColor(isSet ? Color.accentColor : Color.gray)
				}
	}
}

struct BookmarkButton_Previews: PreviewProvider {
	static var previews: some View {
		BookmarkButton(isSet: .constant(true))
	}
}

