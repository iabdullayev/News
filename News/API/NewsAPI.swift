//
//  NewsAPI.swift
//  News
//
//  Created by Feruza Atahodjaeva on 5/15/20.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import RealmSwift

class NewsAPI: API {
    func getArticles() -> [Article] {
        return [Article]()
    }
    
    func getArticles(_ completionHandler: @escaping () -> Void) {
        let secret = URLQueryItem(name: "secret", value: "CHWGk3OTwgObtQxGqdLvVhwji6FsYm95oe87o3ju")
        var urlComponents = URLComponents(string: "https://learnappmaking.com/ex/news/articles/Apple")!
        urlComponents.queryItems = [secret]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if error != nil {
                print("Error \(error!.localizedDescription)")
                return
            }
            if data == nil || response == nil {
                print("Something went wrong")
                return
            }
            
            let realm = try! Realm()
            realm.beginWrite()
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                for article in response.articles {
                    realm.add(article, update: .modified)
                }
                
            } catch {
                print("JSON Error \(error.localizedDescription)")
                return
            }
            
            do {
                try realm.commitWrite()
            } catch (let error) {
                print("What? No Realm? \(error)")
            }
            
            DispatchQueue.main.async {
                completionHandler()
            }
        }
        task.resume()
    }
    
    
}
