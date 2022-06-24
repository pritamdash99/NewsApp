//
//  ViewController.swift
//  NewsApp
//
//  Created by Pritam Dash on 22/06/22.
//

import UIKit

//TableView
//CustomCell
//API Caller
//Open the News Story
//Search for new story
class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return table
    }()
    
    private var viewModels = [NewsTableViewCellViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "News"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        //We need to embed the 1st screen in a navigation controller
        
        APICaller.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let articles) :
                self?.viewModels = articles.compactMap({
                    NewsTableViewCellViewModel(
                        title: $0.title,
                        subtitle: $0.description ?? "No Description",
                        imageURL: URL(string: $0.urlToImage ?? ""))
                })
                DispatchQueue.main.async {
                    <#code#>
                }
                
                break
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    //TableView Functions
    
    //Giving the tableView some frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else{
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

