//
//  AuthenticationView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    var env: FirebaseEnv
//    var info: AppDelegate
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(
                    destination: SignIn(env: env),
                    label: {Text("Sign in").modifier(SignInModifier())}
                )
                NavigationLink(
                    destination: LoginWithGoogle(env: env),
                    label: {Text("Sign in with google").modifier(SignInModifier())}
                )
                NavigationLink(
                    destination: LoginWithFacebook(env: env),
                    label: {Text("Sign in with facebook").modifier(SignInModifier())}
                )
                NavigationLink(
                    destination: LoginWithPhoneNumber(env: env),
                    label: {Text("Sign in with phone number").modifier(SignInModifier())}
                )
                NavigationLink(
                    destination: SignUp(env: env),
                    label: {Text("Create an account")}
                )
            }
            .navigationTitle("Home")
        }
    }
}

struct SignInModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity,  alignment: .center)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

//struct AuthenticationView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthenticationView()
//    }
//}
