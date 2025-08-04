//
//  RandomNumberView.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 8/2/25.
//


import SwiftUI

struct RandomNumberView: View {
    @State var randomNumber = 0

    var body: some View {
        VStack {
            Text("Random number is: \(randomNumber)")
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
        }.padding(.bottom)
        
        // try with both state and observed object
        // use CounterViewSO for @StateObject
        // use CounterViewOO for @ObservedObject
        CounterViewSO()
    }
}

#Preview {
    RandomNumberView()
}


final class CounterViewModel: ObservableObject {
    @Published var count = 0

    func incrementCounter() {
        count += 1
    }
}

// MARK: Counter View using @StateObject
struct CounterViewSO: View {
    @StateObject var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("Count is: \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

// MARK: Counter View using @ObservedObject
struct CounterViewOO: View {
    @ObservedObject var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("Count is: \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}
