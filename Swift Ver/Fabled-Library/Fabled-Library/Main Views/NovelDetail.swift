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
        var test = NovelQuery(websiteURL: novelData.websiteURL, relativeNovelURL: novelData.relativeURL)
        //.environment(\.managedObjectContext, self.moc)
        return VStack(){
            
            // Novel Data
            BookGlance(novel: novelData)
            
            // Novel Synopsis Scroll View
            BookSynopsis(novel: novelData)
            
            //ScrollView {
            //    ForEach(book.chapters, id: \.self) { chapter
            //        Text("\(chapter.title)")
            //    }
            //}

           
        }
    }
    
    // This function returns the number of rows and columns needed to show numberOfChapters
    func rowsColsGroupingCal(numberOfChapter: Int) -> (Int, Int)
    {
        let columns:Double = 2
        
        var rows: Double = Double(numberOfChapter) / columns
        rows.round(.up)
        return (Int(rows), Int(columns))
    }
   
    /*
    func queryNovel(novel: Novel) -> NovelData
    {
        let query: NovelData = NovelData(websiteURL: novel.websiteURL, relativeNovelURL: novel.relativeURL)
        //query.starter()
        //let numChapters = query.chaptersArray.count
        //let (numRows, numCols) = rowsColsGroupingCal(numberOfChapter: numChapters)
        return query
    }
     */

}

struct NovelDetail_Previews: PreviewProvider {
    static var previews: some View {
        NovelDetail(novelData: novelData[0]).environmentObject(NovelQuery(websiteURL: novelData[0].websiteURL, relativeNovelURL: novelData[0].relativeURL))
    }
}


