
import Foundation

struct Post: Identifiable{
    let id = UUID()
    
    let userName: String
    let userImage: String
    let image: String
    let likes: Int
    let comment: Comments
    
    static let preview: [Post] = Array(repeating: Post(userName: "Izumi", userImage: "profilepic", image: "testImage", likes: 150, comment: Comments(User: "Tester1", Comment: "This is a comment for testing")), count: 10)
}

struct Comments: Decodable{
    let User: String
    let Comment:String
    
    static let preview: [Comments] = Array(repeating: Comments(User: "Mavic", Comment:"Successful people appear to be traveling along one continual, successful road. What is not apparent is the perseverance it takes following each defeat to keep you on that road. No one I know of has ever experienced one success after another without defeats, failures, disappointments, and frustrations galore along the way. Learning to overcome those times of agony is what separates the winners from the losers." ), count: 5)
}


