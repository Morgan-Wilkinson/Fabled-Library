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
        VStack{
            ScrollView{
            Text(chapterText)
                .font(.body)
                .fontWeight(.light)
                .padding()
            }
        }
    }
}

struct Reader_Previews: PreviewProvider {
    static var previews: some View {
        Reader(chapterText: "GOOO BOOOG \n UJNNBJUN")
    }
}
