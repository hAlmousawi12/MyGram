//
//  Post.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/3/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import Foundation


struct Post: Codable, Identifiable {
    var id = UUID()
    
    var sender: String
    var sendersComment: String
    var likes: Int
    var commentsNum: Int
    var timee: String
    var postImage: URL
    var comments: [Comment]

}

struct Comment: Codable, Identifiable{
    var id = UUID()
    
    var comment: String
    var sender: String
    var senderPFP: URL
}
