//
//  Child.swift
//  MaritalStatus
//
//  Created by Daniel Pustotin on 28.07.2021.
//

import Foundation

struct Child: Identifiable, Equatable {
	var id = UUID()
	var name: String
	var age: Int
}
