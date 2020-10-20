//
//  HomeViewController.swift
//  mekedi
//
//  Created by prk on 01/09/20.
//  Copyright © 2020 prk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var fullName : String?
    var address : String?
    var email : String?
    
    @IBAction func myplan(_ sender: Any) {
        performSegue(withIdentifier: "home_to_main", sender: nil)
    }
    
    @IBAction func gallery(_ sender: Any) {
        performSegue(withIdentifier: "home_to_gallery", sender: nil)
    }
    
    @IBAction func callorie(_ sender: Any) {
        performSegue(withIdentifier: "home_to_callorie", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("Fullname \(fullName)")
        print("Address \(address)")
        print("Email \(email)")
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
