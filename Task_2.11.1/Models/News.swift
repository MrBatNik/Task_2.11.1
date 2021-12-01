//
//  News.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import Foundation

struct News: Decodable {
    
    let title: String?
    let date: String?
    let teaser: String?
    let image: String?
    let text: String?
    
    init(newsItem: [String: Any]) {
        title = newsItem["title"] as? String
        date = newsItem["date"] as? String
        teaser = newsItem["teaser"] as? String
        image = newsItem["image"] as? String
        text = newsItem["text"] as? String
    }
    
    static func getNews(from value: Any) -> [News] {
        guard let allNews = value as? [[String: Any]] else { return [] }
        var myNews: [News] = []
        
        for newsItem in allNews {
            let news = News(newsItem: newsItem)
            myNews.append(news)
        }
        return myNews
    }
    
}
