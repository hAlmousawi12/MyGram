//
//  NewPost.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/3/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct NewPost: View {
    @StateObject var postEnv = PostEnv()
    @State var comment = ""
    var body: some View {
        VStack {
            TextField("Enter you tweet", text: $comment)
                .frame(width: 320, height: 65)
                .padding()
                .background(Color.gray.opacity(0.5).blur(radius: 5))
                .cornerRadius(10)
                .shadow(radius: 10)

            
            Button {
                postEnv.addItem(post: Post(sender: postEnv.user.username,
                                           sendersComment: self.comment,
                                           likes: 0, commentsNum: 0,
                                           timee: String(Date().timeIntervalSince1970),
                                           postImage: ""))
            } label: {
                Text("Add Post")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .frame(width: 230, height: 50)
            .padding()
            .background(Color.gray.opacity(0.5).blur(radius: 5))
            .cornerRadius(10)
            .padding()
            .shadow(radius: 10)

        }.onAppear {
//            postEnv.getUsername()
        }
    }
}

struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
            .preferredColorScheme(.dark)
    }
}
