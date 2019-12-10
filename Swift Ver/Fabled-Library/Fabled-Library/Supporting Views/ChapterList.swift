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
    var chapters: [ChapterData]
    let rowNumber: Int = 2
    let columnNumber: Int = 2
    
    var body: some View {
        ScrollView {
            NavigationView {
                HelperListView(rows: chapters.count/rowNumber, cols: columnNumber) { row, column in
                    ChapterListElement(chapter: self.chapters[row * self.rowNumber + column])
                }
            }
        }
    }
}
