//
//  Postenv.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/3/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI
import Pods_FirebaseTemplate

class PostEnv: ObservableObject{
    let collectionName = "posts"
    @Published var posts: [Post] = []
    @Published var alertShown = false
    @Published var alertMessage = ErrorMessages.none.message
    @Published var user: User = User()
    @Published var userid = Networking.getUserId() ?? ""
    @Published var imageURL: URL? = nil
    
    func getUser() {
        Networking.getSingleDocument("users/\(userid)") { user in
            self.user = user
        }
        
        Networking.downlodImage(storagePath: "users/\(userid).png") { imageURl in
            self.imageURL = imageURl
        }
    }
    
    func updateUser(user: User, updatedImage: UIImage?) {
        Networking.createItem(user, inCollection: "users", withDocumentId: userid) {
            print("user have been updated successfully")
        }
        
        if let image = updatedImage {
            Networking.uploadImage(path: "users", imageName: userid, image: image) {
                print("profile picture have been updated successfully")
            }
        }
    }
    
    func loadItems(){
        Networking.getListOf(COLLECTION_NAME: collectionName) { (posts: [Post]) in
            self.posts = posts
        }
    }
    
    func addItem(post: Post){
        Networking.createItem(post, inCollection: collectionName, withDocumentId: "\(post.id)") {
            self.showAlert(alertType: .success)
        } fail: { (error) in
            self.showAlert(alertType: .fail)
        }
    }
    
    func likePost(post: Post) {
        Networking.createItem(post, inCollection: collectionName, withDocumentId: "\(post.id)") {
            print("you have liked the post")
        } fail: { (error) in
            print("❌❌❌\(error?.localizedDescription)❌❌❌")
        }
        
        Networking.createItem(post, inCollection: "users/\(userid)/likedPosts", withDocumentId: "\(post.id)") {
            print("you have liked the post")
        } fail: { (error) in
            print("❌❌❌\(error?.localizedDescription)❌❌❌")
        }
        
    }
    
    func unlikePost(post: Post) {
        Networking.createItem(post, inCollection: collectionName, withDocumentId: "\(post.id)") {
            print("you have liked the post")
        } fail: { (error) in
            print("❌❌❌\(error?.localizedDescription)❌❌❌")
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

