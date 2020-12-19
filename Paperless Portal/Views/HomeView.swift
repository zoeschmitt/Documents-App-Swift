//
//  HomeView.swift
//  Paperless Portal
//
//  Created by Zoe Schmitt on 4/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct Document: Identifiable {
    var id = UUID()
    let name: String
    let editDate: String
    let progress: CGFloat
}

struct Notification: Identifiable {
    var id = UUID()
    let message: Bool
    let image: String
    let title: String
    let content: String
}

let docs: [Document] = [Document(name: "Basic Information", editDate: "Last Edited 10/19/19", progress: 0.92), Document(name: "Past Home Ownership", editDate: "Last Edited 9/12/19", progress: 0.57), Document(name: "Home Information", editDate: "Last Edited 2/19/20", progress: 0.87), Document(name: "Background Check", editDate: "Last Edited 10/19/19", progress: 0.27), ]


let notifications: [Notification] = [Notification(message: true, image: "Rectangle", title: "Linda Miller", content: "Hey John! Just wanted to check in on your progress with the title for 1234 Example rd. If you have any issues don’t hesitate to contact me!"), Notification(message: false, image: "doc.text.fill", title: "Title Commitment", content: "The official title agreement for 1234 Example rd has moved on to the closing department. It is now 85% complete!"), Notification(message: true, image: "Rectangle Copy 2", title: "Marc Johnson", content: "Hey John! Just wanted to check in on your progress with the title for 1234 Example rd. If you have any issues don’t hesitate to contact me!"), Notification(message: true, image: "Rectangle Copy 3", title: "Linda Miller", content: "Hey John! Just wanted to check in on your progress with the title for 1234 Example rd. If you have any issues don’t hesitate to contact me!"), ]

struct HomeView: View {
   // @Binding var pushPage: Int
    @State var currentDoc: Int = 0
    let currentPISize = 15
    let pageISize = 10
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                TopMenuView()
                    .padding(.horizontal, 25)
                
                StatusBarsView()
                    .padding(.horizontal, 25)
                    .padding(.bottom, 25)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< docs.count) { doc in
                            HStack {
                                DocumentViewButton(doc: docs[doc], first: doc == 0 ? true : false)
                                    .padding(.trailing, 25)
                            }
                            .padding(.vertical, 40)
                            .padding(.leading, doc == 0 ? 25 : 0)
                        }
                    }
                }
                
                HStack {
                    Text("Notifications")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 30)
                
                VStack(spacing: 10) {
                    ForEach(notifications) { notif in
                            NotificationView(notification: notif)
                                .padding(.vertical, 20)
                    }
                }
                
            }
            .padding(.vertical, 25)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct StatusBarsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 7, style: .continuous)
                    .frame(height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 0.2)))
                RoundedRectangle(cornerRadius: 7, style: .continuous)
                    .frame(width: 300, height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)))
                    .onAppear() {
                        Animation.interactiveSpring()
                }
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .frame(height: 10)
                    .foregroundColor(Color.yellow.opacity(0.2))
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .frame(width: 250, height: 10)
                    .foregroundColor(.yellow)
                .onAppear() {
                        Animation.interactiveSpring()
                }
            }
        }
    }
}

struct TopMenuView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Your")
                    .font(.system(size: 34, weight: .light, design: .rounded))
                    .tracking(1.5)
                    .padding(.bottom, 3)
                Text("Portal")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .tracking(1.5)
            }
            
            Spacer()
            
            Image(systemName: "gear")
                .font(.system(size: 26, weight: .semibold))
                .foregroundColor(Color.yellow)
                .padding(.horizontal, 10)
            
            
            Image(systemName: "bubble.left.fill")
                .font(.system(size: 26, weight: .semibold))
                .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)))
                .padding(.horizontal, 10)
            
            Image(systemName: "doc.text.fill")
                .font(.system(size: 26, weight: .semibold))
                .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)))
                .padding(.horizontal, 10)
        }
    }
}

struct DocumentViewButton: View {
    let doc: Document
    let first: Bool

    var body: some View {
        ZStack {
            
            first ? Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)) : Color.white
                //.cornerRadius(14)
            
            HStack {
                Spacer()
                
                Image("Group").renderingMode(.template)
                    .foregroundColor(first ? Color.white : Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)))
            }
            
            VStack {
                
                HStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .frame(width: 50, height: 25)
                        .foregroundColor(first ? .white : Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)))
                        .overlay(Text("\(Int(doc.progress * 100)) %")
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                        .foregroundColor(first ? Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)) : .white))
                    Spacer()
                }
                .padding(.top, 25)
                .padding(.leading, 15)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(doc.name)
                        .font(.system(size: 26, weight: .semibold, design: .rounded))
                        .foregroundColor(first ? .white : .black)
                        .padding(.bottom, 4)
                    Text(doc.editDate)
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .foregroundColor(first ? .white : .gray)
                    
                    HStack(spacing: 3) {
                        Capsule()
                            .frame(width: (100 * doc.progress),height: 3)
                            .foregroundColor(Color(#colorLiteral(red: 0.6901960784, green: 0.8666666667, blue: 0.5803921569, alpha: 1)))
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(first ? .white : Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)))
                    }
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 25)
                
            }
            .frame(width: 190, height: 270)
        }
        .frame(width: 190, height: 270)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 0)
    }
}

struct NotificationView: View {
    let notification: Notification
    
    var body: some View {
        ZStack {
            HStack {
                Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)).opacity(0.08)
            }
            .cornerRadius(14)
            
            HStack {
                VStack() {
                    if notification.message {
                        Image(notification.image)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                            .offset(x: -10, y: -10)
                    
                    } else {
                        Image(systemName: notification.image)
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)))
                            .frame(width: 70, height: 70)
                            .background(Color.white)
                            .cornerRadius(9)
                            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                            .offset(x: -10, y: -10)
                    }
                    
                    Image(systemName: "bubble.left.fill")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(notification.message ? .yellow : .clear)
                        .offset(x: -5)
                        .padding(.bottom, 15)
                }
                .padding(.trailing, 1)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(notification.title)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .lineLimit(1)
                    
                    Text(notification.content)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .lineLimit(3)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 25)
            }
        }
        .frame(height: 85)
        .padding(.horizontal, 30)
    }
}
