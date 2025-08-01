//
//  AppetizerCell.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 7/30/25.
//

import SwiftUI

struct AppetizerCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .clipShape(.rect(cornerRadius: 16))

            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerCell(appetizer: MockData.sampleAppetizer)
}
