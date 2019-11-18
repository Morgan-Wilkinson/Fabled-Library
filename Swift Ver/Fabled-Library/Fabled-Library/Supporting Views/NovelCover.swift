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
            .frame(minWidth: 175, idealWidth: 250, maxWidth: 260, minHeight: 175, idealHeight: 250, maxHeight: 270, alignment: .center)
    }
}

struct NovelCover_Previews: PreviewProvider {
    static var previews: some View {
        NovelCover(image: Image("TrashCount"))
    }
}
