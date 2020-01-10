//
//  BookAuthor.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/23/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct BookSynopsis: View {
    var novel: Novel
    var body: some View {
        // Novel Synopsis Data
        Text(novel.synopsis)
           .font(.body)
           .multilineTextAlignment(.leading)
           .padding([.leading, .trailing])
    }
}

struct BookGlance: View {
    var novel: Novel
    var latestChapter: Int16
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top) {
                // Novel book cover
                NovelCover(image: novel.image)
                    .padding()
                
                // Vertical Stack to hold the Novel's Text Info
                VStack(alignment: .leading){
                    // Novel Author
                    Text("Author: \(novel.author) \nTranslation Group: \(novel.translationGroup) \nTranslator: \(novel.translator) \n\nLatest Chapter: \(latestChapter)")
                        .fontWeight(.medium)
                        .font(.callout)
                }.padding([.top, .trailing])
            } 
            BookSynopsis(novel: self.novel)
        }
    }
}

struct BookAuthor_Previews: PreviewProvider {
    static var previews: some View {
        BookGlance(novel: novelData[0], latestChapter: 16)
    }
}
