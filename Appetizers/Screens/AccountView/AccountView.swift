//
//  AccountView.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 19/07/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()

    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section(header: Text("Request")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Reffils", isOn: $viewModel.user.frequentRefills)
                }
                    .navigationTitle("😃Account")
            }
            .onAppear{
                viewModel.retrieveUser()
            }
            .alert(item: $viewModel.alertItem){ alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
        }
    }
}

#Preview {
    AccountView()
}
