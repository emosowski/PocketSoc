//
//  NewYorkView.swift
//  Security App
//
//  Created by Emily on 12/28/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit

class locationViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
//            self.navigationController?.navigationBar.barTintColor = UIColor.white

        
        
        // Do any additional setup after loading the view.
 
    
    self.navigationItem.title = "PocketSoc"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    

}
