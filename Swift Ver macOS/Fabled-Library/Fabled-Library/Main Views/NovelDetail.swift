//
//  NovelDetail.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/8/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import CoreData
import SwiftUI

struct NovelDetail: View {
    var novelData: Novel
    // Core Data
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Books.entity(), sortDescriptors: []) var books: FetchedResults<Books>
    
    var body: some View {
        let novel = NovelQuery(websiteURL: novelData.websiteURL, relativeNovelURL: novelData.relativeURL)
        ForEach(books, id: \.self) { book in
            if book == novel.name
            {
                novel.starter(result: book)
            }
            else{novel.starter(result: nil)}
        }
        return VStack(){
            ScrollView{
                VStack{
                    // Novel Data
                    BookGlance(novel: self.novelData, latestChapter: novel.latestChapter)
                    // Scroll and navigation view of the chapters
                    ChapterList(novel: novel, chapters: novel.chaptersArray)
                }
            }.navigationBarTitle("\(novelData.name)", displayMode: .inline)
            .onAppear(perform: {
                let bookAdder = Books(context: self.managedObjectContext)
                bookAdder.id = UUID()
                bookAdder.novelHomePage = novel.novelHomePage
                bookAdder.latestChapter = Int16(novel.latestChapter)
                do {
                    try self.managedObjectContext.save()
                } catch {
                    // handle the Core Data error
                    print("Error saving Book!")
                }
            })
        }
    }
}

struct NovelDetail_Previews: PreviewProvider {
    static var previews: some View {
        NovelDetail(novelData: novelData[0]).environmentObject(NovelQuery(websiteURL: novelData[0].websiteURL, relativeNovelURL: novelData[0].relativeURL))
    }
}


