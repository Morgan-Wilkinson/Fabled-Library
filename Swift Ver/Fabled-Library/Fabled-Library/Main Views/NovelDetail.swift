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
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        let novel = NovelQuery(websiteURL: novelData.websiteURL, relativeNovelURL: novelData.relativeURL)
        novel.getNovelHomePage()
        novel.getAllChaptersURLS(novelHomePage: novel.novelHomePage)
        
         return NavigationView{
                VStack(){
                // Novel Data
                BookGlance(novel: novelData, latestChapter: novel.latestChapter)

                // Scroll and navigation view of the chapters
                ChapterList(novel: novel, chapters: novel.chaptersArray)
            }
        }
    }
}

struct NovelDetail_Previews: PreviewProvider {
    static var previews: some View {
        NovelDetail(novelData: novelData[0]).environmentObject(NovelQuery(websiteURL: novelData[0].websiteURL, relativeNovelURL: novelData[0].relativeURL))
    }
}


