//
//  SearchPageTableViewController.swift
//  Ctrl C, Ctrl Free
//
//  Created by Shivani Ravindra on 7/20/22.
//

import UIKit

class SearchPageTableViewController: UITableViewController, UISearchBarDelegate {

    let data = ["Pacifica Vegan Longwear Eyeliner", "Pacifica Vegan Waterproof Eyeliner", "Pacifica Vegan Care Balm", "Pacifica Enlightened Gloss", "Milani Flora Tinted Lip Balm", "Milani Easy Brow Pencil", "Milani Precision Brow Pencil", "Milani Baked Blush"]
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController{
            vc.pImage = UIImage(named: data[indexPath.row])!
            vc.productLabel = data[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        cell.imageView?.image = UIImage(named: data[indexPath.row])
        
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
