//
//  NewsTableViewController.swift
//  News
//
//  Created by Feruza Atahodjaeva on 5/11/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var api: API
    var articles = [Article]()
    
    required init?(coder: NSCoder) {
        api = MockAPI()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        articles = api.getArticles()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        cell.configureCell(with: articles[indexPath.row])
        
        return cell
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
