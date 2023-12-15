//
//  BookDetailView.swift
//  BookList-Compassable-SwiftUI
//
//  Created by Jinu on 15/12/2023.
//

import SwiftUI
import ComposableArchitecture

struct BookDetailView: View {
    let store: StoreOf<BookDetailReducer>
    var body: some View {
        WithViewStore(self.store, observe: {$0}){  viewStore in
            List {
                if viewStore.isLoading{
                    ProgressView()
                }else if let characters = viewStore.characters{
                    ForEach(characters, id: \.url){ character in
                        Text(character.name)
                        
                    }
                } 
                else{
                    Text("Something went wrong")
                }
            }
                
        }
    }
}

#Preview {
    BookDetailView(store: Store(initialState: BookDetailReducer.State(book: Book.mock), reducer: {
        BookDetailReducer()
    }))
}
