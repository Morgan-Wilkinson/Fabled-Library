//
//  ChapterList.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 12/7/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

// Main View
struct ChapterList: View {
    let novel: NovelQuery
    var chapters: [ChapterData]
    let rowNumber: Int = 2
    let columnNumber: Int = 2
    
    var body: some View {
        List (){
            HelperListView(rows: chapters.count/rowNumber, cols: columnNumber) { row, column in
               // ChapterListElement(novelquery: self.novel, index: (row * self.rowNumber + column), chapter: self.chapters[row * self.rowNumber + column])
                NavigationLink(destination: Reader(chapterText: self.novel.returnOneParsedChapter(chosenChapter: row * self.rowNumber + column))){
                    Text("\(self.chapters[row * self.rowNumber + column].title)")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color.black)
                    }
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .leading)
                .padding()
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
            }
        }.frame(minWidth: 800, idealWidth: 2500, maxWidth: 3000, alignment: .center)
    }
}
