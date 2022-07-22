//
//  FirstViewController.swift
//  Ctrl C, Ctrl Free
//
//  Created by KoolPGHome on 7/22/22.
//

import UIKit
import AVFoundation



class FirstViewController: UIViewController {
    
    
    
    @IBOutlet weak var barcodeText: UILabel!
    

    
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    var dict = ["06877353052":"Pacifica Vegan Longwear Eyeliner",
                 "068773530523":"Pacifica Vegan Waterproof Eyeliner",
                 "068773530524":"Pacifica Vegan Care Balm",
                 "068773530525":"Pacifica Enlightened Gloss",
                 "0071748921025":"Milani Flora Tinted Lip Balm",
                 "0071748921026":"Milani Easy Brow Pencil",
                 "0071748921027":"Milani Precision Brow Pencil",
                 "0071748921028":"Milani Baked Blush",
                 "0609332833258":"e.l.f. Tinted Lip Oil",
                 "0609332833259":"e.l.f. BB Cream SPF 20",
                 "0609332833257":"e.l.f. Pure Skin Toner",
                 "0609332833256":"e.l.f. Pure Skin Moisturizer",
                 "0609332833255":"e.l.f. Blush",
                 "0609332833254":"e.l.f. Putty Bronzer",
                 "0609332833253":"e.l.f. Putty Blush",
                 "5060544973494":"Ciaté London Wonderland Mascara"]
    
    
    @IBAction func barcodeTapped(_ sender: UIButton) {
        var keys: Dictionary<UIKey, NSValue>.Keys
        for (key, value) in dict {
            
            if Barcode.barcode == key{
                barcodeText.text = "Product is Cruelty Free"
                barcodeText.sizeToFit()
            }
        }

    }
    
    

}
