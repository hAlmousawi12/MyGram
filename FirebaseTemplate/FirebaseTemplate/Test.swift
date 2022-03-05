//
//  Test.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/5/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct Test: View {
    @StateObject var env = PostEnv()
    @State var test = ""
    var body: some View {
        VStack {
            TextField("enter a meow", text: $test)
            
            Button {
                env.addItem(post: Post(sender: "", sendersComment: test, likes: 4, commentsNum: 4, timee: "", postImage: ""))
            } label: {
                Text("Add Item 1")
            }
            
            
            Button {
                env.removeItem(post: Post(sender: "", sendersComment: "", likes: 4, commentsNum: 4, timee: "", postImage: ""))
            } label: {
                Text("remove meow")
            }

            
        }
    }
}
struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
