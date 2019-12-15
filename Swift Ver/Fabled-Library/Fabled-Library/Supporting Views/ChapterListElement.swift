//
//  ChapterList.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/9/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct ChapterListElement: View {
    let novelquery: NovelQuery
    let index: Int
    var chapter: ChapterData
    
    
    var body: some View {
        NavigationLink(destination: Reader(chapterText: novelquery.returnOneParsedChapter(chosenChapter: index))){
            Text("\(chapter.title)")
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(Color.black)
        }
       //.buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, maxHeight: 150, alignment: .leading)
        .padding()
        .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
    }
}
