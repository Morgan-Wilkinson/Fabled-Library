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
    @State private var isActive: Bool = false
    
    var body: some View {
        ScrollView{
            HelperListView(rows: self.chapters.count/self.rowNumber, cols: self.columnNumber) { row, column in
                ChapterListElement(novelQuery: self.novel, index: row * self.rowNumber + column, chapter: self.chapters)
                }
                
            }
        }
}

/*
 NavigationLink(destination: Reader(chapterText: self.novel.returnOneParsedChapter(chosenChapter: row * self.rowNumber + column))){
 Text("\(self.chapters[row * self.rowNumber + column].title)")
     .font(.subheadline)
     .fontWeight(.light)
     .foregroundColor(Color.black)
 
 
 */
