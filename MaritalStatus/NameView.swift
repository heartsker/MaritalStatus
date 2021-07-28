//
//  NameView.swift
//  MaritalStatus
//
//  Created by Daniel Pustotin on 28.07.2021.
//

import SwiftUI

struct NameView: View {

	@State var name: String = defaults.object(forKey: "name") as? String ?? ""
	@State var surname: String = defaults.object(forKey: "surname") as? String ?? ""

	var body: some View {
		VStack {

			Text("Your full name:")
				.font(.title)
				.foregroundColor(mainColor)
				.frame(width: screen.width / 2)
				.padding()
				.background(highlightColor)
				.clipShape(RoundedRectangle(cornerRadius: 10))

			TextField("name", text: $name, onCommit:  {
				defaults.setValue(name, forKey: "name")
			})
			.frame(width: screen.width / 2)
			.padding()
			.background(backgroundColor)
			.clipShape(RoundedRectangle(cornerRadius: 10))

			TextField("surname", text: $surname, onCommit:  {
				defaults.setValue(surname, forKey: "surname")
			})
			.frame(width: screen.width / 2)
			.padding()
			.background(backgroundColor)
			.clipShape(RoundedRectangle(cornerRadius: 10))
		}
	}
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
