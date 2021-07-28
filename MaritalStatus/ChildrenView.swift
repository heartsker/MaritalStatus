//
//  ChildrenView.swift
//  MaritalStatus
//
//  Created by Daniel Pustotin on 28.07.2021.
//

import SwiftUI

struct ChildrenView: View {

	@Binding var children: [Child]
	@Binding var showingAddChild: Bool

	var canAddChild: Bool {
		children.count < 5
	}

	var body: some View {
		VStack {
			Text("Children:")
				.font(.title)
				.foregroundColor(mainColor)
				.frame(width: screen.width / 2)
				.padding()
				.background(highlightColor)
				.clipShape(RoundedRectangle(cornerRadius: 10))

			List {
				ForEach(children) { child in
					HStack(spacing: 16) {
						Spacer()
						Text("Name: \(child.name)")
						Spacer()
						Text("Age: \(child.age)")
						Spacer()
					}
				}.onDelete(perform: { indexSet in
					indexSet.forEach { children.remove(at: $0) }

				})
			}

			switch canAddChild {
			case true:
				Button {
					showingAddChild = true
				} label: {
					Text("Add child")
						.padding()
				}
			default:
				Text("You can have only 5 children")
			}
		}
	}
}

struct ChildrenView_Previews: PreviewProvider {
    static var previews: some View {
		ChildrenView(children: .constant([]), showingAddChild: .constant(true))
    }
}
