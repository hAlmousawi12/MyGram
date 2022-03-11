//
//  Profile.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/5/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI
import ImagePickerView
import SDWebImageSwiftUI

struct Profile: View {
    @State private var showImagePicker = false
    @State private var image: UIImage = UIImage(named: "pfp")!
    @State var updatedUsername = ""
    var env: PostEnv
    var fireEnv: FirebaseEnv
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                SignOutButton(env: fireEnv)
            }
            Spacer()
            ZStack {
                WebImage(url: env.imageURL)
                    .resizable()
                    .placeholder(Image(uiImage: image))
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    
                ZStack {
                    
                    Circle()
                        .trim(from: 0, to: 0.35)
                        .foregroundColor(Color.gray.opacity(0.65))
                        .rotationEffect(Angle(degrees: 27))
                    Text("Edit")
                        .font(.title3)
                        .padding(.top, 100)
                    
                }.frame(width: 150, height: 150)
                
            }.onTapGesture {
                showImagePicker = true
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(sourceType: .photoLibrary) { image in
                    self.image = image
                }
            }
            
            TextField("Enter your new username", text: $updatedUsername)
                .frame(width: 320, height: 65)
                .padding()
                .background(Color.gray.opacity(0.5).blur(radius: 5))
                .cornerRadius(10)
                .shadow(radius: 10)
            
            
            
            Button {
                env.updateUser(user: User(username: updatedUsername, email: env.user.email), updatedImage: image)
            } label: {
                Text("Update")
                    .font(.title2)
                
            }
            .frame(width: 230, height: 50)
            .padding()
            .background(Color.gray.opacity(0.5).blur(radius: 5))
            .cornerRadius(10)
            .padding()
            .shadow(radius: 10)
            
            Spacer()
            HStack {
                NavigationLink(destination: Home(postEnv: env, env: fireEnv)) {
                    Image(systemName: "house")
                        .foregroundColor(.white)
                }
                
                Spacer()
                NavigationLink(destination: NewPost(), label: {
                    Image(systemName: "plus.square")
                        .foregroundColor(.white)
                })
                Spacer()
                    WebImage(url: env.imageURL)
                        .resizable()
                        .placeholder(Image("pfp"))
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())


                        }
            .font(.largeTitle)
            .padding(5)
        }.onAppear {
            env.getUser()
            updatedUsername = env.user.username
            
        }
        .navigationBarHidden(true)
    }
}

//struct Profile_Previews: PreviewProvider {
//    static var previews: some View {
//        Profile(env: PostEnv())
//            .preferredColorScheme(.dark)
//    }
//}
