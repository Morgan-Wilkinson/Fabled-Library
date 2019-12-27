//
//  ChapterList.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/9/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct ChapterListElement: View {
    let novelQuery: NovelQuery
    let index: Int
    var chapter: [ChapterData]
    
    
    var body: some View {
        NavigationLink(destination: Reader(chapterText: novelQuery.returnOneParsedChapter(chosenChapter: index))){
            Text("\(chapter[index].title)")
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(Color.black)
            
            }
        .frame(width: 165, height: 40, alignment: .leading)
        .padding()
        .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
    }
}
