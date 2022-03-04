//
//  PostView.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/4/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Image(post.sender.lowercased())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(post.sender.lowercased())
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            Text(post.sendersComment)
            
            
            HStack {
                HStack(spacing: 2) {
                    Image(systemName: "heart")
                    Text("\(post.likes)")
                        .font(.subheadline)
                }
                HStack(spacing: 2) {
                    Image(systemName: "message")
                    Text("\(post.commentsNum)")
                        .font(.subheadline)
                }
                Spacer()
                Image(systemName: "paperplane")
            }.font(.title2)
            
            
        }
        .padding()
        .background(Color.gray.opacity(0.5).blur(radius: 5))
        .shadow(radius: 10)
        .cornerRadius(10)
    }
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostView(post: Post(sender: "h.almousawi12", sendersComment: "Testing", likes: 4231, commentsNum: 235, timee: "", postImage: ""))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
            PostView(post: Post(sender: "cwtheflash", sendersComment: "Testing", likes: 4231, commentsNum: 235, timee: "", postImage: ""))
                .previewLayout(.sizeThatFits)
                .padding()
        }
            
    }
}
