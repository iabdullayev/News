//
//  MockAPI.swift
//  News
//
//  Created by Feruza Atahodjaeva on 5/11/20.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class MockAPI: API {
    func getArticles() -> [Article] {
        var article = Article()
        article.id = "1234567890"
        article.title = "Blah Blah Blah"
        article.text = "Blah Blah BlahBlah Blah BlahBlah Blah BlahBlah Blah BlahBlah Blah BlahBlah Blah BlahBlah Blah BlahBlah Blah BlahBlah Blah BlahBlah Blah Blah"
        article.url = "https://learnappmaking.com/ex/lipsum.html"
        article.publisher = "Sunday Times"
        article.author = "Iskandar Abdullayev"
        article.image = "https://placeimg.com/1000/800/tech"
        
        return Array(repeating: article, count: 15)
    }
    
    func getArticles(_ completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    
}
