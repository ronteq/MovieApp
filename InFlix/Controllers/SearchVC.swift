//
//  SearchVC.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

enum SearchMode {
    case movie
    case actor
    case director
}

class SearchVC: UIViewController{
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    fileprivate let searchNames = ["Search by Movie", "Search by Actor", "Search by Director"]
    fileprivate let availableSearchModes = [SearchMode.movie, .actor, .director]
    
    fileprivate let iconImageNames = ["iconMovie", "iconActor", "iconDirector"]
    fileprivate var searchMode : SearchMode = .movie
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == Segues.searchSegue{
            if let movieHomeVC = segue.destination as? MovieHomeVC, let placeholder = sender as? String{
                movieHomeVC.placeholder = placeholder
                movieHomeVC.searchMode = searchMode
            }
        }
    }
}

//MARK: -Initial Setup

extension SearchVC{
    
    fileprivate func initialSetup(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate struct CellId{
        static let searchCellId = "mainCell"
    }
    
    fileprivate struct Segues{
        static let searchSegue = "searchSegue"
    }
}

//MARK: -TableView methods

extension SearchVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconImageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.searchCellId, for: indexPath) as! SearchCell
        
        let iconImageName = iconImageNames[indexPath.row]
        let searchName = searchNames[indexPath.row]
        
        cell.iconImageView.image = UIImage(named: iconImageName)
        cell.searchTextLabel.text = searchName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchMode = availableSearchModes[indexPath.row]
        
        let placeholder = searchNames[indexPath.row]
        performSegue(withIdentifier: Segues.searchSegue, sender: placeholder)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

