//
//  AddChildView.swift
//  MaritalStatus
//
//  Created by Daniel Pustotin on 28.07.2021.
//

import SwiftUI

struct AddChildView: View {

	@Binding var showingAddChild: Bool
	@Binding var children: [Child]

	@State var newChildName: String = ""
	@State var newChildAge: String = ""
	@State var showingAlert: Bool = false

	var body: some View {
		ZStack {
			backgroundColor
			VStack {
				HStack {
					Button(action: {
						showingAddChild = false
					}, label: {
						Image(systemName: "plus")
							.font(.largeTitle)
							.foregroundColor(vitalColor)
							.rotationEffect(Angle(degrees: 45))
					})

					Spacer()
				}

				Spacer()
				Text("New child")
					.font(.title)
				Spacer()

				TextField("Name", text: $newChildName)
					.keyboardType(UIKeyboardType.alphabet)
					.font(.title2)
					.foregroundColor(mainColor)
					.background(highlightColor)
					.clipShape(RoundedRectangle(cornerRadius: cornersRadius, style: .continuous))
				TextField("Age", text: $newChildAge)
					.keyboardType(UIKeyboardType.numberPad)
					.font(.title2)
					.foregroundColor(mainColor)
					.background(highlightColor)
					.clipShape(RoundedRectangle(cornerRadius: cornersRadius, style: .continuous))

				Spacer()

				HStack {
					Spacer()

					Button(action: {
						guard !newChildName.isEmpty && !newChildAge.isEmpty else {
							showingAlert = true
							return
						}
						showingAddChild = false
						children.append(Child(name: newChildName, age: Int(newChildAge)!))
						newChildName = ""
						newChildAge = ""
					}, label: {
						Text("Add")
					})
					.alert(isPresented: $showingAlert) {
						Alert(title: Text("Please provide correct input"), dismissButton: .default(Text("OK")))
					}
				}
			}
			.background(backgroundColor)
			.ignoresSafeArea()
		}
		.font(.headline)
		.foregroundColor(Color.accentColor)
		.multilineTextAlignment(.center)
		.padding()
		.frame(width: screen.width / 2, height: screen.height / 4)
		.background(backgroundColor)
		.clipShape(RoundedRectangle(cornerRadius: cornersRadius, style: .continuous))
		.offset(x: showingAddChild ? 0 : screen.width)
		.ignoresSafeArea()
		.animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.9))
	}
}

struct AddChildView_Previews: PreviewProvider {
    static var previews: some View {
		AddChildView(showingAddChild: .constant(true), children: .constant([]))
    }
}
