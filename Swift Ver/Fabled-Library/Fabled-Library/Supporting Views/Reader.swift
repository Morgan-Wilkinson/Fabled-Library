//
//  Reader.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 12/8/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct Reader: View {
    var chapterText: String
    
    var body: some View {
        Text(chapterText)
            .font(.body)
            .fontWeight(.light)
            .padding()
            .frame(minWidth: 800, idealWidth: 2500, maxWidth: 3000, alignment: .center)
    }
}

struct Reader_Previews: PreviewProvider {
    static var previews: some View {
        Reader(chapterText: "GOOO BOOOG \n UJNNBJUN")
    }
}
