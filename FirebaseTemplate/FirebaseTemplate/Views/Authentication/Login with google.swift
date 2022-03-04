//
//  Login with google.swift
//  FirebaseTemplate
//
//  Created by Hussain on 7/11/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

import Firebase

struct LoginWithGoogle: View {
    var env: FirebaseEnv
    var body: some View {
        Button(action: {
            env.signUpWithGoogle()
        }, label: {
            Text("LOG IN WITH GOOGLE")
                .font(.system(size: 12.5, weight: .light))
//                .foregroundColor(Color("lightText"))
        })
    }
}

//struct Login_with_google_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginWithGoogle()
//    }
//}
