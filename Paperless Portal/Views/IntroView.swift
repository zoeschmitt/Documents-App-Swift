//
//  IntroView.swift
//  Paperless Portal
//
//  Created by Zoe Schmitt on 4/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct PageIndicatorCircleView: View {
    let currentPage: Bool
    var width: CGFloat
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: currentPage ? 4 : width/2, style: .continuous)
            .foregroundColor(color)
            .frame(width: width, height: 10)
    }
}

struct IntroView: View {
    @Binding var loggedIn: Bool
    @ObservedObject var store = DataStore()
    let pages: [Page] = [Page(illust: "Illustration1", title: "Welcome to Paperless Portal", descp: "A simple, secure, and convenient platform for title management."), Page(illust: "Illustration2", title: "Simplicity", descp: "Paperless Portal provides an easy and secure way for clients to input required information, keeping everyone safe and informed throughout the transaction."), Page(illust: "Illustration3", title: "Secure", descp: "With Paperless Portal, you can be confident that client information will be handled and stored in a secure enviroment."), Page(illust: "Illustration4", title: "Convenient", descp: "Paperless Portal provides a platform for communication with clients through notifications and SMS. Clients can also keep an eye on the progress of their paperwork.")]
    @State var page: Int = 0
    let pageISize: CGFloat = 10
    let currentPISize: CGFloat = 16
    var body: some View {
        VStack {
            Spacer()
            
            Image(pages[page].illust)
                .padding(.bottom, 70)
            
            Text(pages[page].title)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .tracking(2)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
                .padding(.horizontal, 25)
            
            
            Text(pages[page].descp)
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .tracking(1.5)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding(.horizontal, 25)
            
            Spacer()
            
            HStack {
                
                Button(action: page != 0 ? {
                    self.page -= 1
                    } : {print("hi")}) {
                        Text("PREV")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(page != 0 ? .orange : .clear)
                }
                
                
                Spacer()
                
                if page != pages.count - 1 {
                    ForEach(0 ..< pages.count) { pag in
                        PageIndicatorCircleView(currentPage: pag == self.page ? true : false, width: pag == self.page ? self.currentPISize : self.pageISize, color: pag == self.page ? Color.orange : Color.gray.opacity(0.2))
                    }
                    .animation(.easeOut(duration: 0.2))
                }
                
                Spacer()
                
                if page != pages.count - 1 {
                    Button(action: {
                        self.page += 1
                    }){
                        Text("NEXT")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(.blue)
                    }
                } else {
                    Button(action: {
                        self.loggedIn = true
                    }) {
                        Text("GET STARTED")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.all, 10)
                    }
                    .background(Color.yellow)
                    .cornerRadius(9)
                    .shadow(color: Color.yellow.opacity(0.2), radius: 1, x: 0, y: 0)
                }
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 50)
        }
    }
}

//struct IntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroView(loggedIn: false)
//    }
//}
