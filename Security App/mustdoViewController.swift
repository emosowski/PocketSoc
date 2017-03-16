//
//  mustdoViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 2/22/17.
//  Copyright © 2017 emilyosowski. All rights reserved.
//

import UIKit

class mustdoViewController: UIViewController  {

override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "PocketSoc"
    
    
    // Do any additional setup after loading the view.
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
}
