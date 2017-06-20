//
//  SearchVC.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    fileprivate var movie: Movie?
    fileprivate let searchNames = ["Search by Movie", "Search by Actor", "Search by Director"]
    fileprivate let iconImageNames = ["iconMovie", "iconActor", "iconDirector"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "searchSegue"{
            if let movieHomeVC = segue.destination as? MovieHomeVC, let placeholder = sender as? String{
                movieHomeVC.placeholder = placeholder
            }
        }
    }
}

//MARK: TableView methods

extension SearchVC{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.searchCellId, for: indexPath) as! SearchCell
        
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
        let placeholder = searchNames[indexPath.row]
        performSegue(withIdentifier: "searchSegue", sender: placeholder)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
