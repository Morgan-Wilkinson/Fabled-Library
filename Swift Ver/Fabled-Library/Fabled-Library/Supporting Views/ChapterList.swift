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
        HStack(){
            List (){
                HelperListView(rows: chapters.count/rowNumber, cols: columnNumber) { row, column in
                    ChapterListElement(novelquery: self.novel, index: (row * self.rowNumber + column), chapter: self.chapters[row * self.rowNumber + column])
                }
            }.frame(minWidth: 800, idealWidth: 2500, maxWidth: 3000, alignment: .center)
            
        }
    }
}
