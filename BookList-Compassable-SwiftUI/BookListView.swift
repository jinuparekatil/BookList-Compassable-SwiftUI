//
//  ContentView.swift
//  BookList-Compassable-SwiftUI
//
//  Created by Jinu on 14/12/2023.
//

import SwiftUI

struct BookListView: View {
    var body: some View {
        NavigationView {
                
            Text("Hello, world!")
                .navigationTitle("Books")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            
                        }, label: {
                            Text("refresh")
                        })
                    }
                })
        }
        .padding()
    }
}

#Preview {
    BookListView()
}
