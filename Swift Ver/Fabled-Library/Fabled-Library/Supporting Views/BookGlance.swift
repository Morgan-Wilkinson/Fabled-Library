//
//  BookAuthor.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/23/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct BookGlance: View {
    var novel: Novel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top) {
                // Novel book cover
                NovelCover(image: novel.image)
                    .padding()
                
                // Vertical Stack to hold the Novel's Text Info
                VStack(alignment: .leading){
                    // Novel Name
                    Text(verbatim: novel.name)
                        .font(.title)
                        .padding([.top, .bottom, .trailing])
                        
                    // Horizontal Stack to hold the Author and Translator Info.
                    HStack(alignment: .bottom)
                    {
                        // Novel Author
                        Text("Author: \(novel.author) \nTranslation Group: \(novel.translationGroup)")
                            .fontWeight(.bold)
                            .font(.callout)
                            .padding(.trailing, 50.0)
                       
                        // Novel Translator
                        Text("\nTranslator: \(novel.translator)")
                            .fontWeight(.bold)
                            .font(.callout)
                            
                    }
                    // Novel Translator
                    Text("\nLatest Chapter: PLACEHOLDER")
                        .fontWeight(.bold)
                        .font(.callout)
                }
            }
            .padding(.trailing)
        }
        .frame(minWidth: 800, idealWidth: 800, maxWidth: 800, minHeight: 300, idealHeight: 300, maxHeight: 300, alignment: .leading)
    }
}

struct BookAuthor_Previews: PreviewProvider {
    static var previews: some View {
        BookGlance(novel: novelData[0])
    }
}
