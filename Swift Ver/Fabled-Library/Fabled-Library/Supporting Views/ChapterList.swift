//
//  ChapterGroups.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/23/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

// Main view
struct ChapterList<Content: View>: View {
    let rows: Int
    let cols: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                if row % 5 == 0{
                    Divider()
                }
                HStack {
                    ForEach(0 ..< self.cols) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, cols: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.cols = cols
        self.content = content
    }
}

