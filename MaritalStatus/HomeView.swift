//
//  HomeView.swift
//  MaritalStatus
//
//  Created by Daniel Pustotin on 28.07.2021.
//

import SwiftUI

struct HomeView: View {
	@State var children: [Child] = []
	@State var showingAddChild: Bool = false

	var body: some View {
		ZStack {
			VStack {
				NameView()

				ChildrenView(children: $children, showingAddChild: $showingAddChild)
			}
			AddChildView(showingAddChild: $showingAddChild, children: $children)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
