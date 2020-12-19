//
//  Page.swift
//  Paperless Portal
//
//  Created by Zoe Schmitt on 4/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import Foundation

struct Page: Identifiable {
    var id = UUID()
    let illust: String
    let title: String
    let descp: String
}
