//
//  Home.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct SignOutButton: View{
    var env: FirebaseEnv
    var body: some View{
        Button("Signout") {
            env.signOut()
        }
        .foregroundColor(.red)
    }
}

struct Home: View {
    @StateObject var postEnv = PostEnv()
    var env: FirebaseEnv
    var body: some View {
        ZStack {
            VStack {
                header
                
                
                Divider()
                Spacer()
                
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(postEnv.posts) { post in
                        PostView(post: post, env: postEnv)
                    }
                }
                Spacer()
                Divider()
                
                bottom
            }.padding(10)
        }
        .navigationBarHidden(true)
        .onAppear {
            postEnv.loadItems()
            postEnv.getUser()
        }
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            Home()
//                .preferredColorScheme(.dark)
//            Home()
//                .preferredColorScheme(.light)
//        }
//    }
//}
