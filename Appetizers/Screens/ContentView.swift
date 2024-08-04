//
//  ContentView.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 19/07/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color.customBrandPrimary)
    }
}

//struct AppetizerListView: View {
//    var body: some View {
//        Text("Appetizer List")
//    }
//}

#Preview {
    AppetizerTabView()
}

