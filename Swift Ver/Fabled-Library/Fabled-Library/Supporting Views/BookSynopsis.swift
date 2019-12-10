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
           .padding([.leading, .bottom])
        }
        .frame(maxWidth: .infinity, maxHeight: 150, alignment: .center)
    }
}

struct BookSynopsis_Previews: PreviewProvider {
    static var previews: some View {
        BookSynopsis(novel: novelData[0])
    }
}
