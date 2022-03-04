//
//  FirebaseEnv.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn

class FirebaseEnv: ObservableObject{
    @Published var signedIn: Bool = (FirebaseAuth.Auth.auth().currentUser != nil)
    @Published var username = ""
    var info: AppDelegate
    var userid = Networking.getUserId() ?? ""
    
    init(info: AppDelegate) {
        self.info = info
    }
    
    func signIn(user: SignInCredentials, success: @escaping (String) -> Void,  fail: ((Error?) -> Void)?){
        Networking.signIn(user: user, success: { uid in
            self.signedIn = true
            success(uid)
        }, fail: fail)
    }
    
    func signOut(){
        Networking.signOut()
        self.signedIn = false
    }
    
    func signUp(user: User, password: String){
        Networking.signUp(user: user, password: password) { (uid) in
            self.signedIn = true
        }
    }
    
    func signUpWithGoogle() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    
    func getUsername() {
        Networking.getSingleDocument("users/\(userid)/fullName") { username in
            self.username = username
        }
    }
    
    
}
