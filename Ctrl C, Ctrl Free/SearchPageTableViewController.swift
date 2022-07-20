//
//  SearchPageTableViewController.swift
//  Ctrl C, Ctrl Free
//
//  Created by Shivani Ravindra on 7/20/22.
//

import UIKit

class SearchPageTableViewController: UITableViewController, UISearchBarDelegate {

    let data = ["Pacifica", "e.l.f.", "glossier", "Milani", "dove", "PlantBase", "Suave", "NYX", "Bare Minerals", "Colour Pop", "Too Faced", "Lush", "The Body Shop", "Covergirl", "Essence", "Tarte", "Milk Makeup"]
    var filteredData : [String]!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filteredData = data
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filteredData = data
        }
            else {
        filteredData = []
        for product in data {
            if product.lowercased().contains(searchText.lowercased()) {
                filteredData.append(product)
            }
        }
        
    }
        self.tableView.reloadData()
        
}
}
