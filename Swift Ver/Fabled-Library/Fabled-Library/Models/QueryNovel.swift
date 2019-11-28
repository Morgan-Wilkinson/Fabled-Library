//
//  QueryNovel.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/16/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import Foundation
import SwiftSoup
import SwiftUI

// Struct that holds the chapter name and url
struct ChapterData{
    let title: String
    let relativeURL: String
    var rawChapterData: String?
    var parsedChapterData: String?
}

// A class that holds a variety of functions that query a novels information in a variety of ways
class QueryNovel: ObservableObject {
    // Error enum
       enum ParseError: Error {
           case runtimeError(String)
       }
    
    // Constructor for websiteURL and relativeNovelURL
    var websiteURL, relativeNovelURL: String
    
    init(websiteURL: String, relativeNovelURL: String) {
        self.websiteURL = websiteURL
        self.relativeNovelURL = relativeNovelURL
    }
    
    // Will be filled by functions
    var error: Error?
    // Get the novel's home page
    var novelHomePage: String?
    // Get the last chapter currently
    var latestChapter: Int?
    // Mutable instance of an array of ChapterData.
    var chaptersArray: [ChapterData] = []
    
    // A function that returns a novelHomePage and all of its data. Should always be called at least once
    // before any other functions.
    func getNovelHomePage(){
        // Dispatch Group to wait for functions to complete
        let group = DispatchGroup()
        
        // Enter a dispatch group to wait for function tasks to complete
        group.enter()
        
        // URL
        let homePage = URL(string: self.websiteURL+self.relativeNovelURL)!
        
        // Create a session that we can use for this request
        let session = URLSession(configuration: .default)

        // Create a task that will be responsible for downloading the index page.
        let task = session.dataTask(with: homePage, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
           
           // ensure we did not get an error
           guard error == nil else {
                self.novelHomePage = nil
                self.error = error
                group.leave()
                return
            }
           
            // Convert response to an HTTPURLResponse so we can get the status code
            // Ensure we got back a status code of 200 to 299
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    self.error = ParseError.runtimeError("Status Code outside 200 - 299 range")
                    self.novelHomePage = nil
                    group.leave()
                    return
                }
            // Make sure we received the data
            if let receivedData = data {
                DispatchQueue.main.async {
                    self.novelHomePage = String(decoding: receivedData, as: UTF8.self)
                    group.leave()
                }
            }
        })
        task.resume()
        
        group.wait()
        return
    }
    
    
    // A function that returns an Array of struct ChapterData of chapter indices where the title is the chapter name
    // and the relativeURL is the chapter's relative url
    func getAllChaptersURLS(novelHomePage: String) -> Void {
        // Dispatch Group to wait for functions to complete
        let group = DispatchGroup()
        // Enter a dispatch group to wait for function tasks to complete
        group.enter()
        
        // Uses a global background thread to prevent the main thread from becoming inactive as this requires a bit of time to process
        DispatchQueue.global(qos: .background).async {
            // Do all parsing of the document for the desired info.
            do {
                // Retrieve the panel where all the chapters are located.
                let novelTOCPanel: Elements = try SwiftSoup.parse(novelHomePage).select("div.panel-group")
                // Retrieve all the volume tab panels. Note: . represents a space in SwiftSoup
                let allVolumesPanel: Elements = try novelTOCPanel.select("div.panel.panel-default")
                let volumeBody: Elements = try allVolumesPanel.select("div.panel-body")
                for volume in volumeBody{
                    let chaptersInVolume: Elements = try volume.select("a")
                    for chapterHTML in chaptersInVolume
                    {
                        // maybe add some guard statements
                        self.chaptersArray.append(ChapterData(title: (try chapterHTML.text()), relativeURL: (try chapterHTML.attr("href")), rawChapterData: nil, parsedChapterData: nil))
                    }
                }
                self.latestChapter = self.chaptersArray.count
           }
            catch Exception.Error(let type, let message) {
               print("Type: \(type) and Message: \(message)")
           } catch {
               return
           }
            // Explicitly refer to class member group
            group.leave()
        }
        group.wait()
        return
    }
    
    
    // A function that returns a single chapter page data based off the data received from getAllNovelChaptersURLS
    func downloadOneRawNovelChapter(desiredChapter: Int) -> Void{
        // Dispatch Group to wait for functions to complete
        let group = DispatchGroup()
        
        let url = URL(string: (self.websiteURL+self.chaptersArray[desiredChapter].relativeURL))!
        
        // Enter a dispatch group to wait for function tasks to complete
        group.enter()
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    let message = ParseError.runtimeError("Status Code outside 200 - 299 range")
                    print(message)
                    return
            }
            if let mimeType = httpResponse.mimeType, mimeType == "text/html",
                let receivedData = data,
                let rawPageDataString = String(data: receivedData, encoding: .utf8) {
                self.chaptersArray[desiredChapter].rawChapterData = rawPageDataString
                // Explicitly refer to class member group
                group.leave()
            }
        }
        task.resume()
        group.wait()
        return
    }
    
    // A function that returns a single chapter page data based off the data received from getAllNovelChaptersURLS
    func downloadAllRawNovelChapters() -> Void{
        // Dispatch Group to wait for functions to complete
        let group = DispatchGroup()
        
        for chapter in 0..<self.latestChapter!
        {
            // Enter a dispatch group to wait for function tasks to complete
            group.enter()
            let url = URL(string: (self.websiteURL+self.chaptersArray[chapter].relativeURL))!
            
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                }
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                        let message = ParseError.runtimeError("Status Code outside 200 - 299 range")
                        print(message)
                        return
                }
                if let mimeType = httpResponse.mimeType, mimeType == "text/html",
                    let receivedData = data,
                    let rawPageDataString = String(data: receivedData, encoding: .utf8) {
                    self.chaptersArray[chapter].rawChapterData = rawPageDataString
                    // Explicitly refer to class member group
                    group.leave()
                }
            }
            task.resume()
        }
        group.wait()
        return
    }
    
    
    // A function that returns a single parsed chapter page data based off the data received from getAllNovelChaptersURLS
    func parseOneRawNovelChapter(desiredChapter: Int) -> Void{
        // Dispatch Group to wait for functions to complete
        let group = DispatchGroup()
        
        // Enter a dispatch group to wait for function tasks to complete
        group.enter()
        
        // Uses a global background thread to prevent the main thread from becoming inactive as this requires a bit of time to process
        DispatchQueue.global(qos: .background).async {
            // Do all parsing of the document for the desired info.
            do {
                // Retrieve the panel where all the chapters are located.
                let rawChapterHTML: String = self.chaptersArray[desiredChapter].rawChapterData!
                
                let rawChapterContentHTML: Elements = try SwiftSoup.parse(rawChapterHTML).select("div.fr-view")
                let parsedChapterContentHTML = try rawChapterContentHTML.select("p")
                //parsedChapterContentHTML = try parsedChapterContentHTML.select("br")
                var chapterContent = try parsedChapterContentHTML.html()
                chapterContent = chapterContent.replacingOccurrences(of: "\n", with: "\n\n")
                chapterContent = chapterContent.replacingOccurrences(of: "<br>", with: "\n")
                self.chaptersArray[desiredChapter].parsedChapterData = chapterContent
           }
            catch Exception.Error(let type, let message) {
               print("Type: \(type) and Message: \(message)")
           } catch {
               return
           }
            // Explicitly refer to class member group
            group.leave()
        }
        group.wait()
        return
    }
    
    // A function that returns all parsed chapters page data based off the data received from getAllNovelChaptersURLS
    func parseAllRawNovelChapters() -> Void{
        // Dispatch Group to wait for functions to complete
        let group = DispatchGroup()
        
        // Enter a dispatch group to wait for function tasks to complete
        group.enter()
        
        // Uses a global background thread to prevent the main thread from becoming inactive as this requires a bit of time to process
        DispatchQueue.global(qos: .background).async {
            // Do all parsing of the document for the desired info.
            do {
                for chapter in 0..<self.latestChapter!
                {
                    // Retrieve the panel where all the chapters are located.
                    let rawChapterHTML: String = self.chaptersArray[chapter].rawChapterData!
                    
                    let rawChapterContentHTML: Elements = try SwiftSoup.parse(rawChapterHTML).select("div.fr-view")
                    let parsedChapterContentHTML = try rawChapterContentHTML.select("p")
    
                    var chapterContent = try parsedChapterContentHTML.html()
                    chapterContent = chapterContent.replacingOccurrences(of: "\n", with: "\n\n")
                    chapterContent = chapterContent.replacingOccurrences(of: "<br>", with: "\n")
                    self.chaptersArray[chapter].parsedChapterData = chapterContent
                     
                }
            }
            catch Exception.Error(let type, let message) {
                print("Type: \(type) and Message: \(message)")
            } catch {
               return
           }
            // Explicitly refer to class member group
            group.leave()
        }
        group.wait()
        return
    }
    
    func starter()
    {
        if self.novelHomePage == nil{
            self.getNovelHomePage()
            self.getAllChaptersURLS(novelHomePage: self.novelHomePage!)
        }
        else if self.chaptersArray.isEmpty{
            self.getAllChaptersURLS(novelHomePage: self.novelHomePage!)
        }
        return
    }
    
    func returnAllParsedChapters() -> [ChapterData]
    {
        starter()
        self.downloadAllRawNovelChapters()
        self.parseAllRawNovelChapters()
        return self.chaptersArray
    }
    
    func returnOneParsedChapter(chosenChapter: Int) -> ChapterData
    {
        if self.chaptersArray.indices.contains(chosenChapter) == false{
            starter()
            self.downloadOneRawNovelChapter(desiredChapter: chosenChapter)
            self.parseOneRawNovelChapter(desiredChapter: chosenChapter)
        }
        
        return self.chaptersArray[chosenChapter]
    }
}

/*
let test = QueryNovel(websiteURL: "https://www.wuxiaworld.com", relativeNovelURL: "/novel/trash-of-the-counts-family")
var abbb = test.returnOneParsedChapter(chosenChapter: 6)
print(abbb.parsedChapterData)
*/
