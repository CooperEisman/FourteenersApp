//
//  DetailView.swift
//  Fourteeners
//
//  Created by devbuild on 2/15/21.
//  Copyright © 2021 Cooper Eisman. All rights reserved.
//

import SwiftUI

struct DetailView: View {
	@EnvironmentObject var modelData: ModelData

    var body: some View {
		Text("My Ass")
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView()
			.environmentObject(ModelData())
	}
}
