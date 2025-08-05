//
//  StateBindingView.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 8/2/25.
//

import SwiftUI

struct StateBindingView: View {
    @State private var quantity = 15

    var body: some View {
        StepperView(quantity: $quantity)
    }
}

struct StepperView: View {
    @Binding var quantity: Int

    var body: some View {
        Stepper("Quantity: \(quantity)", value: $quantity, in: 10...30)
    }
}
