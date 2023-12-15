//
//  BookListReducer.swift
//  BookList-Compassable-SwiftUI
//
//  Created by Jinu on 14/12/2023.
//

import Foundation
import ComposableArchitecture

class BookListReducer : Reducer{
    
    struct State : Equatable{
        static func == (lhs: BookListReducer.State, rhs: BookListReducer.State) -> Bool {
            false
        }
        
      
        var path = StackState<BookDetailReducer.State>()
        
        var books: [Book]?
    }
    enum Action{
        case fetchBooks
        case booksFetched([Book]?)
        case path(StackAction<BookDetailReducer.State, BookDetailReducer.Action >)
    }
    var body: some ReducerOf<BookListReducer>{
        Reduce { state, action in
            switch action{
            case .fetchBooks:
                return .run { send in
                    let bookListUrl = "https://anapioficeandfire.com/api/books"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: bookListUrl)!)
                    let books = try? JSONDecoder().decode([Book].self, from: data)
                    await send(.booksFetched(books))
                }
            case let .booksFetched(books):
                state.books = books
                return .none
            case .path:
                return .none
            }
        }
        
        .forEach(\.path,action: /Action.path){
                BookDetailReducer()
            }
    }
}
