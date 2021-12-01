//
//  NewsTableViewController.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var news: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsPreviewTableViewCell
        let news = news[indexPath.row]
        
        cell.fetchCellData(with: news)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NewsDetailsViewController", sender: news[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? NewsDetailsViewController else { return }
        
        viewController.someNews = sender as? News
    }

}

extension NewsTableViewController {
    
    private func fetchNews() {
        NetworkManager.getData { news in
            self.news = news
            self.tableView.reloadData()
        }
    }
    
}
