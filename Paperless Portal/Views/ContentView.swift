//
//  ContentView.swift
//  Paperless Portal
//
//  Created by Zoe Schmitt on 4/29/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
     @ObservedObject var store = DataStore()
    @State var loggedIn = false
    @State var pages: Int = 0
    var body: some View {
        ZStack {
            
            if !loggedIn {
                IntroView(loggedIn: $loggedIn)
            } else {
                HomeView()
//                if pages == 0 {
//                   // HomeView(pushPage: $pages)
//                }
//                else if pages == 1 {
//                    MessagesView()
//                }
//                else if pages == 2 {
//                    DocumentsView()
//                }
//                else if pages == 3 {
//                    NotificationsView()
//                }
//                else if pages == 4 {
//                    //DocView()
//                } else {
//                   // HomeView(pushPage: $pages)
//                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
