//
//  ContentView.swift
//  BookList-Compassable-SwiftUI
//
//  Created by Jinu on 14/12/2023.
//

import SwiftUI
import ComposableArchitecture

struct BookListView: View {
    let store : StoreOf<BookListReducer >
    var body: some View {
        NavigationView {
            
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                List {
                    
                    if let books = viewStore.books{
                        ForEach(books, id: \.isbn){ book in
                            Text(book.name)
                        }
                    }
                    else {
                        Text("Book list empty. refresh the page.")
                    }
                    
                }
                
                
                
                .navigationTitle("Books")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            viewStore.send(.fetchBooks
                            )
                        }, label: {
                            Text("refresh")
                        })
                    }
                })
            }
        }
        .padding()
    }
}

#Preview {
    BookListView(store: Store(initialState: BookListReducer.State(), reducer: {
        BookListReducer()
    }))
}
