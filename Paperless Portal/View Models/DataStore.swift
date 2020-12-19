//
//  DataStore.swift
//  Paperless Portal
//
//  Created by Zoe Schmitt on 4/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class DataStore: ObservableObject {
    
    @Published var user = User(firstName: "Zoe", lastName: "Schmitt", loggedIn: false)

//    init() {
//        fetchPosts()
//    }
//
//    func fetchPosts() {
//        Api().getPosts { (posts) in
//            self.posts = posts
//        }
//    }
}
