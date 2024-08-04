//
//  Alert.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 28/07/24.
//

import SwiftUI
struct AlertItem: Identifiable{
    let id = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
}
struct AlertContext{
    //MARK - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server is invalid. Please contact the support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invaildResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid response from the server. Please try again later"),
                                       dismissButton: .default(Text("OK")))
    
    static let invaildURL = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting server. If persist, please contact the support"),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                       message: Text("Unable to complete your request at the moment. Please check your internet connection"),
                                       dismissButton: .default(Text("OK")))
    
    //MARK - Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                       message: Text("Please ensure all the fields in the form have been filled out."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                       message: Text("Please enter a valid email address."),
                                       dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                       message: Text("Your profile information was successfully saved."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                       message: Text("There was an error saving or retrieveing your profile."),
                                       dismissButton: .default(Text("OK")))
    
}
