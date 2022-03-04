//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    @State var user = User()
    @State var password = ""
    var env: FirebaseEnv
    var body: some View {
        Form{
            TextField("username", text: $user.username).keyboardType(.default)
            TextField("email", text: $user.email).keyboardType(.emailAddress)
            SecureField("password", text: $password)
            Button("Sign up"){
                env.signUp(user: user, password: password)
            }
            NavigationLink("Already have an account?", destination: SignIn(env: env))
            
        }
        .navigationTitle("Sign up")
    }
}

//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            SignUp()
//        }
//    }
//}
