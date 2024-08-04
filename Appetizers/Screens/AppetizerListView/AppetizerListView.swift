//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 19/07/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
  
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers) { appetizer in
                    AppetizerCellView(appetizers: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetails = true
                        }
                }
                
                .navigationTitle("🍔Appetizer")
                .disabled(viewModel.isShowingDetails)
            }
            .blur(radius: viewModel.isShowingDetails ? 20 : 0)
            
            
            .onAppear(){
                viewModel.getAppetizers()
            }
            
            if viewModel.isShowingDetails{
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetails)
            }
            
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }

}

#Preview {
    AppetizerListView()
}
