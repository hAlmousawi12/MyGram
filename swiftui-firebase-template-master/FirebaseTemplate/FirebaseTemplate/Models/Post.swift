//
//  Post.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/3/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import Foundation


struct Post: Codable, Hashable, Identifiable {
    var id = UUID()
    
    var sender: String
    var sendersComment: String
    var likes: Int
    var commentsNum: Int
    var timee: String
    var postImage: String

}


var posts: [Post] = [
        
    
    Post(sender: "cwtheflash", sendersComment: "New episodes, more speedsters. #TheFlash returns next Wednesday at 8/7c!", likes: 44562, commentsNum: 300, timee: "3 hours", postImage: "1"),
    Post(sender: "h.almousawi12", sendersComment: "Today with Kuwait codes", likes: 50, commentsNum: 20, timee: "10 hours", postImage: "2"),
    Post(sender: "cwtheflash", sendersComment: "meow", likes: 2497, commentsNum: 34, timee: "7 hours", postImage: "3"),
    
    
]
