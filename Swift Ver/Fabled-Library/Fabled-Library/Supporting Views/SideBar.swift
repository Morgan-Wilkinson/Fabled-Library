//
//  SideBar.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/29/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import CoreData
import SwiftUI

struct SideBar: View {
    var body: some View {
        List(novelData) { novel in
            NavigationLink(destination: NovelDetail(novelData: novel)) {
                NovelRow(novel: novel)
            }
        }
        .listStyle(SidebarListStyle())
        .frame(width:275, alignment: .topLeading)
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
