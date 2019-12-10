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
    var chapter: ChapterData
    
    var body: some View {
       NavigationLink(destination: Reader(chapterText: chapter.parsedChapterData)){
                Text("\(chapter.title)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
       }
       .buttonStyle(PlainButtonStyle())
       .frame(maxWidth: 300, maxHeight: 150, alignment: .leading)
       .padding()
       .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
    }
}

struct ChapterListElement_Previews: PreviewProvider {
    static var previews: some View {
        let test = ChapterData(title: "HI", relativeURL: "String")
        return ChapterListElement(chapter: test)
    }
}
