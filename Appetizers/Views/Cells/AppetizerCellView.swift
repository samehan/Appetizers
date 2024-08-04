//
//  AppetizerCellView.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 20/07/24.
//

import SwiftUI

struct AppetizerCellView: View {
    let appetizers : Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizers.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5){
                Text(appetizers.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("₹ \(appetizers.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerCellView(appetizers: MockData.sampleAppetizer)
}
