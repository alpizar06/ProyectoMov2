
import SwiftUI

struct InstaCell: View {
    let post: Post

    let likes = Int.random(in: 0..<999)
    
    var body: some View {
        VStack{
            HStack(spacing: 16){
                Image(post.userImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text(post.userName)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.title2)
                    .rotationEffect(.degrees(90))
            }
            .padding(.horizontal,8)
            
            Image(post.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            
            HStack(spacing: 16){
                Image(systemName: "heart")
                Image(systemName: "bubble.right")
                Spacer()
            }
            .font(.title2)
            .padding(8)
            
            VStack(alignment: .leading){
                HStack{
                    Text("\(likes) Likes")
                        .font(.headline)
                    Spacer()
                }
                Text(post.userName)
                    .font(.headline)
            }
            .padding(.horizontal)
//            VStack{
//                ForEach(Comments.preview){ comment in
//                    CommentsCell(comments: comments)
//                }
//            }
        }
    }
}

struct InstaCell_Previews: PreviewProvider {
    static var previews: some View {
        InstaCell(post: Post.preview[0])
    }
}
