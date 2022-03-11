//
//  PostView.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/4/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    var post: Post
    var i: Int
    var env: PostEnv
    @State var isLiked = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                WebImage(url: post.postImage)
                    .resizable()
                    .placeholder(Image("pfp"))
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(post.sender.lowercased())
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            Text(post.sendersComment)
                .multilineTextAlignment(.leading)
            
            
            HStack {
                HStack(spacing: 2) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .primary)
                    
                    Text("\(post.likes)")
                        .font(.subheadline)
                }.onTapGesture {
                    
                    if !isLiked {
                        env.likePost(post: Post(id: post.id,sender: post.sender, sendersComment: post.sendersComment, likes: (post.likes + 1), commentsNum: post.commentsNum, timee: post.timee, postImage: post.postImage, comments: post.comments))
                    } else {
                        env.unlikePost(post: Post(id: post.id,sender: post.sender, sendersComment: post.sendersComment, likes: (post.likes - 1), commentsNum: post.commentsNum, timee: post.timee, postImage: post.postImage, comments: post.comments))
                    }
                    self.isLiked.toggle()
                    env.loadItems()
                }
                NavigationLink(destination: Comments(post: post, i: i, env: env)) {
                    HStack(spacing: 2) {
                        Image(systemName: "message")
                        Text("\(post.commentsNum)")
                            .font(.subheadline)
                    }.foregroundColor(.white)
                }
                
            }.font(.title2)
            
            
        }
        .padding()
        .background(Color.gray.opacity(0.5).blur(radius: 5))
        .shadow(radius: 10)
        .cornerRadius(10)
        .padding(5)
    }
}


//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            PostView(post: Post(sender: "h.almousawi12", sendersComment: "Testing", likes: 4231, commentsNum: 235, timee: "", postImage: "", comments: []), env: PostEnv())
//                .preferredColorScheme(.dark)
//                .previewLayout(.sizeThatFits)
//                .padding()
//            PostView(post: Post(sender: "cwtheflash", sendersComment: "Testing", likes: 4231, commentsNum: 235, timee: "", postImage: "", comments: []), env: PostEnv())
//                .previewLayout(.sizeThatFits)
//                .padding()
//        }
//
//    }
//}
