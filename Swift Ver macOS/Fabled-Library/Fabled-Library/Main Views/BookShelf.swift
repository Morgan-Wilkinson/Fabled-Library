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
    //@FetchRequest(entity: Books.entity(), sortDescriptors: []) var book: FetchedResults<Books>
    
    var body: some View {
        VStack(alignment: .leading){
            Text("I'm a bookshelf")
        }
    }
}


struct BookShelf_Previews: PreviewProvider {
    static var previews: some View {
        BookShelf()
    }
}
