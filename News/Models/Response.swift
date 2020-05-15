//
//  Response.swift
//  News
//
//  Created by Feruza Atahodjaeva on 5/15/20.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

struct Response: Codable {
    var count: Int = 0
    var urls: [String : String] = [String : String]()
    var articles:[Article] = [Article]()
}
