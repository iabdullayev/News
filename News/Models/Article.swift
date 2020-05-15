//
//  Article.swift
//  News
//
//  Created by Feruza Atahodjaeva on 5/11/20.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import RealmSwift

class Article: Object, Codable {
    @objc dynamic var id: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var text: String = ""
    @objc dynamic var publisher: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var date: Date = Date()
    
    override static func primaryKey() -> String? {
        "id"
    }
}
