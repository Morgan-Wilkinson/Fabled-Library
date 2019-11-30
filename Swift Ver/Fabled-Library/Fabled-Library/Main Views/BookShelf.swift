//
//  ContentView.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/8/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import CoreData
import SwiftUI

struct BookShelf: View {
    // Core Data
    @Environment(\.managedObjectContext) var moc
    //@FetchRequest(entity: Books.entity(), sortDescriptors: []) var book: FetchedResults<Books>
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                SideBar().environment(\.managedObjectContext, self.moc)
            }
        }
        .frame(minWidth: 800, idealWidth: 1000, maxWidth: 2500, minHeight: 600, idealHeight: 1000, maxHeight: 2500, alignment: .center)
    }
}


struct BookShelf_Previews: PreviewProvider {
    static var previews: some View {
        BookShelf()
    }
}
