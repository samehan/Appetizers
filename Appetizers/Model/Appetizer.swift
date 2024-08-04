//
//  Appetizer.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 20/07/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories : Int
    let protein: Int
    let carbs : Int
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(id: 001,
                                           name: "Test Name",
                                           description: "This is description of the selected appetizer and this is mock data.",
                                           price: 1.89,
                                           imageURL: "",
                                           calories:20,
                                           protein: 4,
                                           carbs: 11)
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 001,
                                           name: "Test Name 1",
                                           description: "This is description of the selected appetizer and this is mock data.",
                                           price: 1.89,
                                           imageURL: "",
                                           calories:20,
                                           protein: 4,
                                           carbs: 11)
    static let orderItemTwo = Appetizer(id: 002,
                                           name: "Test Name 2",
                                           description: "This is description of the selected appetizer and this is mock data.",
                                           price: 1.89,
                                           imageURL: "",
                                           calories:20,
                                           protein: 4,
                                           carbs: 11)
    static let orderItemThree = Appetizer(id: 003,
                                           name: "Test Name 3",
                                           description: "This is description of the selected appetizer and this is mock data.",
                                           price: 1.89,
                                           imageURL: "",
                                           calories:20,
                                           protein: 4,
                                           carbs: 11)
    
    static let orderItem = [orderItemOne, orderItemTwo, orderItemThree]
}
