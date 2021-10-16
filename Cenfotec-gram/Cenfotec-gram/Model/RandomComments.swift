

import Foundation
struct RandomComments: Codable {
    let contents: Contents
}

struct Contents: Codable {
    let quotes: [Quote]
}

struct Quote: Codable {
    let quote, length, author: String
    let tags: [String: String]
    let category, language, date: String
    let permalink: String
    let id: String
    let background: String
    let title: String
}
