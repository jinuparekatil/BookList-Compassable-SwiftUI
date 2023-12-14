//
//  BookListReducer.swift
//  BookList-Compassable-SwiftUI
//
//  Created by Jinu on 14/12/2023.
//

import Foundation
import ComposableArchitecture

class BookListReducer : Reducer{
    
    struct State{
        //We will keep our booklist here
    }
    enum Action{
        // We will keep our actions like fetch books and BooksFetched here.
    }
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        //Functions to perform actions to update state.
    }
}
