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
            Text("I'm a bookshelf")
                //.frame(minWidth: 800, idealWidth: 2500, maxWidth: 3000, minHeight: 800, alignment: .center)
        }
    }
}


struct BookShelf_Previews: PreviewProvider {
    static var previews: some View {
        BookShelf()
    }
}
