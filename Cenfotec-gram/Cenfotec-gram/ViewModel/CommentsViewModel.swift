
import Foundation

class CommentsViewModel: ObservableObject{
    @Published var UserComments = [Comments]()
    
    @Published var user = ""
    @Published var comment = ""
    init(){
       ChargeRandomComments()
    }
    
    func chargeUser(){
        
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
//                print(data!)
//                print(response!)
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(RandomUsers.self, from: data!)
                //print(responseModel)
                self.user = responseModel.results[0].name.first + " " + responseModel.results[0].name.last
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
        
        
    }
    
    
    func chargeComment(){
        
        var request = URLRequest(url: URL(string: "https://quotes.rest/qod")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("nasuke", forHTTPHeaderField: "X-TheySaidSo-Api-Secret")

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
//                print(data!)
//                print(response!)
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(RandomComments.self, from: data!)
                self.comment = responseModel.contents.quotes[0].quote
                //print(responseModel)
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
        
        
    }
    
    func ChargeRandomComments(){
        
        
        for _ in 0..<5{
            chargeUser()
            chargeComment()
            UserComments.append(Comments(User: user, Comment: comment))
        }
    }
}



