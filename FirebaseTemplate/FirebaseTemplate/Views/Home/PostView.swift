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
    var env: PostEnv
    @State var isLiked = UserDefaults.standard.bool(forKey: "isLiked")
    
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
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .primary)
                    
                    Text("\(post.likes)")
                        .font(.subheadline)
                }.onTapGesture {
                    
                    if !isLiked {
                        env.likePost(post: Post(id: post.id,sender: post.sender, sendersComment: post.sendersComment, likes: (post.likes + 1), commentsNum: post.commentsNum, timee: post.timee, postImage: post.postImage))
                    } else {
                        env.likePost(post: Post(id: post.id,sender: post.sender, sendersComment: post.sendersComment, likes: (post.likes - 1), commentsNum: post.commentsNum, timee: post.timee, postImage: post.postImage))
                    }
                    self.isLiked.toggle()
                    UserDefaults.standard.set(isLiked, forKey: "isLiked")
                    env.loadItems()
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
            PostView(post: Post(sender: "h.almousawi12", sendersComment: "Testing", likes: 4231, commentsNum: 235, timee: "", postImage: ""), env: PostEnv())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
            PostView(post: Post(sender: "cwtheflash", sendersComment: "Testing", likes: 4231, commentsNum: 235, timee: "", postImage: ""), env: PostEnv())
                .previewLayout(.sizeThatFits)
                .padding()
        }
        
    }
}
