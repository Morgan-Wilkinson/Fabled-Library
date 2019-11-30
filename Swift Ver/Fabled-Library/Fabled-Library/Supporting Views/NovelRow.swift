//
//  NovelRow.swift
//  Fabled Library
//
//  Created by Morgan Wilkinson on 11/8/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct NovelRow: View {
    var novel: Novel
    
    var body: some View {
        HStack {
            novel.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(verbatim: novel.name)
            //Spacer()
        }
    }
}

struct NovelRow_Previews: PreviewProvider {
    static var previews: some View {
        NovelRow(novel: novelData[0])
    }
}
 
