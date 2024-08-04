//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 22/07/24.
//

import Foundation
import SwiftUI
final class AppetizerListViewModel: ObservableObject{
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetails = false
    @Published var selectedAppetizer : Appetizer?
    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers{ [self]result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result{
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error{
                    case .invaildResponse:
                        alertItem = AlertContext.invaildResponse
                        
                    case .invaildURL:
                        alertItem = AlertContext.invaildURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
