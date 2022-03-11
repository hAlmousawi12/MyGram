//
//  Comments.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/5/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct Comments: View {
    
    var post: Post
    var i: Int
    var env: PostEnv
    @State var newComment = ""
    
    var body: some View {
        VStack {
            Divider()
            Spacer()
            
            
            ScrollView {
                ForEach(post.comments) { comments in
                    HStack {
                        WebImage(url: comments.senderPFP)
                            .resizable()
                            .placeholder(Image("pfp"))
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        
                        Text(comments.comment)
                            .fontWeight(.semibold)
                        Spacer()
                    }.padding()
                    Divider()
                }
            }
            
            
            Spacer()
            Divider()
            
            HStack {
                WebImage(url: env.imageURL)
                    .resizable()
                    .placeholder(Image("pfp"))
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                TextField("Enter your comment", text: $newComment)
                    .frame(width: .infinity, height: 30)
                
                Button {
                    if !newComment.isEmpty {
                        env.posts[i].comments.append(Comment(comment: newComment, sender: env.user.username, senderPFP: env.imageURL!))
                        env.posts[i].commentsNum += 1
                        env.addItem(post: env.posts[i])
                        newComment = ""
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(.blue)
                        
                        Image(systemName: "arrow.up")
                            .foregroundColor(.primary)
                        
                    }.frame(width: 40, height: 40)
                }
                
            }
        }
        .navigationBarTitle("Comments")
        .onAppear{
            env.loadItems()
            env.getUser()
        }
    }
}

//struct Comments_Previews: PreviewProvider {
//    static var previews: some View {
//        Comments(post: Post(sender: "cwtheflash", sendersComment: "Testing", likes: 4231, commentsNum: 235, timee: "", postImage: "", comments: []), env: PostEnv())
//            .preferredColorScheme(.dark)
//    }
//}
