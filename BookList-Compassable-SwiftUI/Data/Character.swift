//
//  Character.swift
//  BookList-Compassable-SwiftUI
//
//  Created by Jinu on 15/12/2023.
//

import Foundation

// MARK: - Character
struct Character: Codable {
    let url: String
    let name, gender, culture, born: String
    let died: String
    let titles, aliases: [String]
    let father, mother, spouse: String
    let allegiances, books: [String]
    let povBooks: [String]
    let tvSeries, playedBy: [String]
}
