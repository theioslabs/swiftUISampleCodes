//
//  ArticleListView.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 8/1/25.
//

import SwiftUI

struct ArticleListView: View {
    @EnvironmentObject var store: ArticleStore

    var body: some View {
        NavigationView {
            List {
                ForEach(store.articles, id: \.self) { article in
                    NavigationLink(destination: ArticleDetailView(title: article)) {
                        Text(article)
                        Text("\(store.articles.count)")
                    }
                }
            }
            .navigationTitle("Articles")
            .toolbar {
                Button("Add") {
                    store.articles.append("\(store.articles.count + 1): Custom New Article")
                }
            }
        }
    }
}

struct ArticleDetailView: View {
    // define Environment Object here
    // use it
    let title: String

    var body: some View {
        Text("You selected: \(title)")
        Text("new label")
            .padding()
    }
}

// Observable data model
class ArticleStore: ObservableObject {
    // main data which is responsible for my List View
    @Published var articles: [String] = [
        "SwiftUI Basics",
        "Understanding @State and @Binding",
        "Mastering EnvironmentObject",
        "random object"
    ]
}
