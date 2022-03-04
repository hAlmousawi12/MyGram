//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignIn: View {
    @State var userCredentials = SignInCredentials(email: "", password: "")
    var env: FirebaseEnv
    @State var alertShown: Bool = false
    @State var alertError: String = ""
    @State var alertIsPresented: Bool = false
    @State var text: String? = nil
    var body: some View {
        VStack(spacing: 15){
            
            TextField("email", text: $userCredentials.email).keyboardType(.emailAddress)
            SecureField("password", text: $userCredentials.password)
            Button("Sign in"){
                env.signIn(user: userCredentials) { (uid) in
                    print("Signed in!")
                } fail: { (error) in
                    alertError = error?.localizedDescription ?? "The Password is incorrect"
                    alertShown = true 
                }
            }
            
            Button("Forgot password?") {
                self.alertIsPresented = true
            }
            
            NavigationLink("Don't have an account?", destination: SignUp(env: env))
            
        }
        .navigationTitle("Sign in")
        .alert(isPresented: $alertIsPresented, TextAlert(title: "Reset password", message: "Enter your email", placeholder: "E-mail", accept: "Confirm", cancel: "Cancel", keyboardType: .emailAddress, action: { result in
            Networking.forgetPassword(email: result ?? "")
        }))
        .alert(isPresented: $alertShown, content: {
            Alert(title: Text("Error!"), message: Text(alertError), dismissButton: .cancel())
        })
        .padding()
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignIn()
//    }
//}
