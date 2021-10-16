
import SwiftUI

struct FeedView: View {
    
    @State var User = UserInformationBase(context: PersistenceController.preview.container.viewContext)
    @State var usuario: String
    
    @ObservedObject var viewModel = CommentsViewModel()
    
    var body: some View {
        NavigationView{
            
            ScrollView{
                ForEach(Post.preview){ post in
                    InstaCell(post: post)
                }
                
            }
            .navigationTitle("Confotec-gram")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    picker()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button(action:{
                    }){
                        NavigationLink(destination: ProfileEditor(User: User, usuario: usuario)){
                            Image(systemName: "person")
                        }
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        
        let newUser = UserInformationBase(context: viewContext)
        return FeedView(User: newUser, usuario: "")
            .environment(\.managedObjectContext,PersistenceController.preview.container.viewContext)
    }
}
