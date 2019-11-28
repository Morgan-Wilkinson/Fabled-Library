//
//  NovelDetail.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/8/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct NovelDetail: View {
    var novelData: Novel


    var body: some View {
        VStack(){
            
            // Novel Data
            BookGlance(novel: novelData)
            
            // Novel Synopsis Scroll View
            BookSynopsis(novel: novelData)
            
            //ScrollView {
                // Chapter List Scroll View
              //  .onAppear {
                    ////ERRROORRRR
                  // var test = self.queryNovel(novel: self.novelData)
                    
                   // test.getNovelHomePage()
                    //Text(QueryNovel.novelHomePage ?? "hi")
                        //.frame(width: 150, height: 35)
                    //let numChapters = test.chaptersArray.count
                    //let (numRows, numCols) = self.rowsColsGroupingCal(numberOfChapter: numChapters)
                    //ChapterList(rows: numRows, cols: numCols) { row, col in
                    //   Text("\(test.chaptersArray[row * numChapters + col].title)")
                    //}
               //}
           // }
            
           // ChapterList(numChapters: self.numChapters, numRows: 5, numCols: 2) { row, col in
                //Text("\(query.chaptersArray[row * numChapters + numCols])")
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
    
    func queryNovel(novel: Novel) -> QueryNovel
    {
        let query: QueryNovel = QueryNovel(websiteURL: novel.websiteURL, relativeNovelURL: novel.relativeURL)
        //query.starter()
        //let numChapters = query.chaptersArray.count
        //let (numRows, numCols) = rowsColsGroupingCal(numberOfChapter: numChapters)
        return query
    }
}

struct NovelDetail_Previews: PreviewProvider {
    static var previews: some View {
        NovelDetail(novelData: novelData[0])
    }
}

