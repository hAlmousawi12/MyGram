//
//  extension.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/4/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI


extension Home {
    
    
    var header: some View {
        HStack {
            Text("MyGram")
                .bold()
                .font(.title)
            Spacer()
            SignOutButton(env: env)
        }
    }
    
    
    var bottom: some View {
        HStack {
            Image(systemName: "house.fill")
            Spacer()
            NavigationLink(destination: NewPost(), label: {
                Image(systemName: "plus.square")
                    .foregroundColor(.white)
            })
            Spacer()
            Image(postEnv.user.username.lowercased())
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
        .font(.largeTitle)
        .padding(5)
    }
    
}
