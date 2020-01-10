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
        ScrollView{             //self.chapters.count
            HelperListView(rows: 9/self.rowNumber, cols: self.columnNumber) { row, column in
                ChapterListElement(novelQuery: self.novel, index: row * self.rowNumber + column, chapter: self.chapters)
                }
                
            }
        }
}
