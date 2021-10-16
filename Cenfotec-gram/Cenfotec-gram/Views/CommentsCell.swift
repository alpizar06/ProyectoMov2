//
//  CommentsCell.swift
//  Cenfotec-gram
//
//  Created by Daniel Alpizar on 16/10/21.
//

import SwiftUI


struct CommentsCell: View {
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("Marvic")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    Spacer()
                }.padding()
                VStack{
                    Text("Successful people appear to be traveling along one continual, successful road. What is not apparent is the perseverance it takes following each defeat to keep you on that road. No one I know of has ever experienced one success after another without defeats, failures, disappointments, and frustrations galore along the way. Learning to overcome those times of agony is what separates the winners from the losers.")
                        .font(.title3)
                }
            }
            
            
            
        }
    }
}

struct CommentsCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsCell()
    }
}
