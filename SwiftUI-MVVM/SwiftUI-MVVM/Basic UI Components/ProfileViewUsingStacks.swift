//
//  ProfileViewUsingStacks.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 8/2/25.
//


import SwiftUI

// basic example of using ZStack, HStack and VStack
struct ProfileViewUsingStacks: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("profilePicture")
                .resizable()
                .aspectRatio(contentMode: .fit)
            // 50% - 50%
            HStack {
                VStack(alignment: .leading) {
                    Text("Rachael Chiseck")
                        .font(.headline)
                    Text("Chief Executive Officer")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.primary)
            .background(Color.primary
                            .colorInvert()
                            .opacity(0.75))
        }
    }
}

#Preview {
    ProfileViewUsingStacks()
}
