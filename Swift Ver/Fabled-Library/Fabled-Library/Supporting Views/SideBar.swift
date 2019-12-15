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
    // Core Data
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationView{
            List(novelData) { novel in
                NavigationLink(destination: NovelDetail(novelData: novel).environment(\.managedObjectContext, self.moc)) {
                    NovelRow(novel: novel)
                }
            }.listStyle(SidebarListStyle())
            .frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
