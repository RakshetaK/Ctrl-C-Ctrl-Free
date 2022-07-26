//
//  SearchPageTableViewController.swift
//  Ctrl C, Ctrl Free
//
//  Created by Shivani Ravindra on 7/20/22.
//

import UIKit

class SearchPageTableViewController: UITableViewController, UISearchBarDelegate {

    var data = ["Afterglow", "Anastasia Beverly Hills", "Bare Minerals", "Benefit", "Bite Beauty", "Burt's Bees", "Cake", "Cloud Cosmetics", "ColourPop", "e.l.f.", "EOS", "Essence", "Fable and Mane", "Glossier", "Juice Beauty", "Kora Organics", "Milani", "Milk Makeup", "Morphe", "NYX",  "Pacifica", "Patchology", "Pure Cosmetics", "Rare Beauty", "Raw Sugar", "SeaChi Organics", "Skylar", "Stellar Beauty", "Tarte", "The Balm", "The Body Shop", "Too Faced", "Truly Beauty", "Urban Decay", "Wet N Wild"]
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
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let vc = (storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController) {
                 vc.pImage = UIImage(named: filteredData[indexPath.row])!
                 vc.productLabel = filteredData[indexPath.row]
                 self.navigationController?.pushViewController(vc, animated: true)
             }
         }
           
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        cell.imageView?.image = UIImage(named: filteredData[indexPath.row])
        
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
