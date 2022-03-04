//
//  Postenv.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/3/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

class PostEnv: ObservableObject{
    let collectionName = "posts"
    @Published var posts: [Post] = []
    @Published var alertShown = false
    @Published var alertMessage = ErrorMessages.none.message
    @Published var user: User = User()
    var userid = Networking.getUserId() ?? ""
    
    func getUsername() {
        Networking.getSingleDocument("users/\(userid)") { user in
            self.user = user
        }
        
        print("😂😂😂\(self.user.username)😂😂😂")
    }
    
    func loadItems(){
        Networking.getListOf(COLLECTION_NAME: collectionName) { (posts: [Post]) in
            self.posts = posts
        }
    }
    
    func addItem(post: Post){
        Networking.createItem(post, inCollection: collectionName) {
            self.showAlert(alertType: .success)
        } fail: { (error) in
            self.showAlert(alertType: .fail)
        }
    }
    
    
    enum ErrorMessages{
        case success, fail, none, incompleteForm
        var message: String{
            switch self{
            case .success: return "تم إضافة العنصر بنجاح"
            case .incompleteForm: return "قم بتعبئة جميع البيانات بشكل صحيح"
            case .fail: return "لم يتم إضافة العنصر، حاول مرة أخرى"
            case .none: return ""
            }
        }
    }
    
    func showAlert(alertType: ErrorMessages){
        self.alertMessage = alertType.message
        self.alertShown = true
    }

    
}

