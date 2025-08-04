//
//  FruitListView.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 8/2/25.
//


import SwiftUI

struct FruitListView: View {
    @State private var fruits = ["Apple", "Banana", "Orange"]
    @State private var newFruit = ""
    
    init() {
        print("FruitListView - init called")
    }

    var body: some View {
        print("FruitListView - body called")
        return NavigationStack {
            VStack {
                HStack {
                    TextField(
                        "",
                        text: $newFruit,
                        prompt: Text("Enter your username")
                            .foregroundColor(.white)
                    )
                        .foregroundColor(.pink)
                        .padding(10)
                        .background(Color.pink.opacity(0.2))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 2)
                        )

                    // @IBAction - touchUpInside
                    Button {
                        guard !newFruit.isEmpty else { return }
                        fruits.append(newFruit)
                        newFruit = ""
                    } label: {
                        Text("Add")
                            .foregroundStyle(.white)
                            .font(.title3)
                    }
                    .buttonStyle(.bordered)
                    .background(.pink)
                    .cornerRadius(12.0)
                }
                .padding()

                List {
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                            // cellForRow
                            ZStack {
                                HStack {
                                    Text(fruit)
                                        .padding(5.0)
                                        .foregroundColor(.white)
                                        .background(.pink)
                                        .cornerRadius(8.0)
                                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                                        .font(.title2)
                                        .padding(.trailing, 15)
                                    if let image = UIImage(named: fruit.lowercased()) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fit)
                                    } else {
                                        Image(.fruitPlaceholder)
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                }
                            }
                            .frame(height: 50.0)
                        }
                    }
                    .onDelete { indexSet in
                        fruits.remove(atOffsets: indexSet)
                    }
                }
                .toolbar {
                    EditButton()
                }
            }
            .navigationTitle("My Fruits")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            print("FruitListView - onAppear called")
        }
        .onDisappear() {
            print("FruitListView - onDisappear called")
        }
    }
}

struct FruitDetailView: View {
    let fruit: String
    
    init(fruit: String) {
        self.fruit = fruit
        print("FruitDetailView - init called")
    }

    var body: some View {
        print("FruitDetailView - body called")
        return VStack(spacing: 20) {
            Text(fruit)
                .font(.largeTitle)
                .bold()
            
            Text("You selected \(fruit). It’s full of nutrients!")
                .multilineTextAlignment(.center)

            Image(fruit.lowercased())
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
        }
        .padding()
        .navigationTitle(fruit)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            print("FruitDetailView - onAppear called")
        }
        .onDisappear() {
            print("FruitDetailView - onDisappear called")
        }
    }
}

struct Fruit {
    let name: String
    let benefits: String
}


#Preview {
    FruitListView()
}
