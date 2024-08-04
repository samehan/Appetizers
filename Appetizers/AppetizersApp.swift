//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 19/07/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
