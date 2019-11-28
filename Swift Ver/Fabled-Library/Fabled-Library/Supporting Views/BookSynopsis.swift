//
//  BookSynopsis.swift
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
    }
}

struct BookSynopsis_Previews: PreviewProvider {
    static var previews: some View {
        BookSynopsis(novel: novelData[0])
    }
}
