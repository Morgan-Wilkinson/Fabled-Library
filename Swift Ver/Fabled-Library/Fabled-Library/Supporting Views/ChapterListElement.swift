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
        HStack() {
            // Fix navigation button style to match hstack
            
           NavigationLink(destination: Reader(chapterText: chapter.parsedChapterData)){
                    Text("\(chapter.title)")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color.black)
            }
            
        }
        
    }
}

struct ChapterListElement_Previews: PreviewProvider {
    static var previews: some View {
        let test = ChapterData(title: "HI", relativeURL: "String")
        return ChapterListElement(chapter: test)
    }
}
