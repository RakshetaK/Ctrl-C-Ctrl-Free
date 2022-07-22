//
//  ProductDetailViewController2.swift
//  Ctrl C, Ctrl Free
//
//  Created by Shivani Ravindra on 7/21/22.
//

import UIKit

class ProductDetailViewController2: UIViewController {

    
    @IBOutlet weak var testLabel: UILabel!
    
    var pLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = pLabel
        
        // Do any additional setup after loading the view.
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
