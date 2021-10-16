
import Foundation

struct RandomUsers: Codable {
    let results: [Result]
}

struct Result: Codable {
    let name: Name
}

struct Name: Codable {
    let title, first, last: String
}
