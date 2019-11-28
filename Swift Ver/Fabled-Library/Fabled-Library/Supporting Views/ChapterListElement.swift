//
//  ChapterList.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/9/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct ChapterListElement: View {
    @EnvironmentObject private var userData: UserData
    var title: String
    
    var body: some View {
        HStack {
            // Create a row that has the chapter and eventually a link to the chapter at which point you can click to bring up the reader for that chapter,
            // Use the path from the novel index page to grab the chapter
            
            Text("\(title)")
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(Color.black)
            Spacer()
        }
        .padding()
        .frame(width: 150, height: 35)
        .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
    }
}

struct ChapterListElement_Previews: PreviewProvider {
    static var previews: some View {
        ChapterListElement(title: "Test")
    }
}
