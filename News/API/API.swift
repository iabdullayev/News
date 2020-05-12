//
//  API.swift
//  News
//
//  Created by Feruza Atahodjaeva on 5/11/20.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol API {
    func getArticles() -> [Article]
    func getArticles(_ completionHandler: @escaping () -> Void)
}
