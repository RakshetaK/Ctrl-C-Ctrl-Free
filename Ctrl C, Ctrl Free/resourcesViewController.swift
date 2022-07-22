//
//  resourcesViewController.swift
//  Ctrl C, Ctrl Free
//
//  Created by Rui Weng on 2022-07-20.
//

import UIKit

class resourcesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func articleButton(_ sender: Any) {
        let url = URL(string:"https://www.hsi.org/issues/animal-testing/")!
        UIApplication.shared.open(url)
    }
    
    @IBAction func articleButton2(_ sender: Any) {
        let url = URL(string:"https://www.hsi.org/issues/be-cruelty-free/")!
        UIApplication.shared.open(url)
    }
    
    @IBAction func articleButton3(_ sender: Any) {
        let url = URL(string:"https://www.hsi.org/issues/biomedical-research/")!
        UIApplication.shared.open(url)
    }
    
    @IBAction func videoButton(_ sender: Any) {
        let url = URL(string:"https://www.youtube.com/watch?v=G393z8s8nFY&t=83s")!
        UIApplication.shared.open(url)
    }
    
    @IBAction func pledgeButton(_ sender: Any) {
        let url = URL(string:"https://action.hsi.org/page/25047/petition/1?ea.tracking.id=website")!
        UIApplication.shared.open(url)
    }
    
    @IBAction func donateButton(_ sender: Any) {
        let url = URL(string:"https://donate.hsi.org/page/23410/donate/1?ea.tracking.id=web-aanm")!
        UIApplication.shared.open(url)
    }
}
