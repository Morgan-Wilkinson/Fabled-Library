//
//  NovelCover.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/8/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct NovelCover: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        }
}

struct NovelCover_Previews: PreviewProvider {
    static var previews: some View {
        NovelCover(image: Image("TrashCount"))
    }
}
