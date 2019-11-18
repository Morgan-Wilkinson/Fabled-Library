//
//  NovelDetail.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/8/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct NovelDetail: View {
    var novel: Novel

    var body: some View {
        VStack(alignment: .leading){
            // Novel Data
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
            
            // Novel Synopsis Data
            VStack(alignment: .leading){
                ScrollView {
                    Text(novel.synopsis)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .bottom, .trailing])
                }
                .padding([.leading, .bottom, .trailing])
            }
            .frame(minWidth: 800, idealWidth: 1000, maxWidth: 2500, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
            
            // Chapter List
            VStack(alignment: .leading){
                ScrollView {
                    // Get latest chapter number and replace
                    Text("Hi")
                }
            }
            .frame(minWidth: 800, idealWidth: 1000, maxWidth: 2500, minHeight: 800, idealHeight: 1000, maxHeight: 2000, alignment: .center)
        }
    }
}


struct NovelDetail_Previews: PreviewProvider {
    static var previews: some View {
        NovelDetail(novel: novelData[0])
    }
}
