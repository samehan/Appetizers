//
//  User.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 03/08/24.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
