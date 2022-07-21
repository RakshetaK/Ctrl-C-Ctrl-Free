//
//  ProductDetailViewController.swift
//  Ctrl C, Ctrl Free
//
//  Created by Shivani Ravindra on 7/20/22.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    var pImage = UIImage()
    var productLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productName.text = productLabel
        productImage.image = pImage
        
    }
}
