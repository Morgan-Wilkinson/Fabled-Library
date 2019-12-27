//
//  Novel.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/8/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct Novel: Hashable, Codable, Identifiable {
    var name: String
    var websiteURL: String
    var relativeURL: String
    var translationGroup: String
    var translator: String
    var author: String
    var synopsis: String
    var id: Int
    fileprivate var imageName: String
}

extension Novel {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

