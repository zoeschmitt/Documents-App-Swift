//
//  DocView.swift
//  Paperless Portal
//
//  Created by Zoe Schmitt on 5/2/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct DocView: View {
     let doc: Document
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                .font(.system(size: 26, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, 25)
                    .onTapGesture {
                        HomeView()
                }
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(doc.name)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .tracking(1.5)
                        .lineLimit(2)
                }
                .padding(.trailing, 5)
                
                Spacer()
                
                Image(systemName: "camera.fill")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(.yellow)
                    .padding(.horizontal, 10)
                
                Image(systemName: "doc.text.fill")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.4196078431, blue: 0.6823529412, alpha: 1)))
                    .padding(.horizontal, 10)
            }
            
            Spacer()
        }
        .padding(.horizontal, 25)
    }
}

//struct DocView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocView()
//    }
//}
