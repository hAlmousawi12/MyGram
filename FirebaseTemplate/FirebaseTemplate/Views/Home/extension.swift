//
//  extension.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/4/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

extension Home {
    
    
    var header: some View {
        HStack {
            Text("MyGram")
                .bold()
                .font(.title)
            Spacer()
            
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
            NavigationLink(destination: Profile(env: postEnv, fireEnv: env) ,label: {
                WebImage(url: postEnv.imageURL)
                    .resizable()
                    .placeholder(Image("pfp"))
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

            })

                    }
        .font(.largeTitle)
        .padding(5)
    }
    
}
