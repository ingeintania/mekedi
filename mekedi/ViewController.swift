//
//  ViewController.swift
//  mekedi
//
//  Created by prk on 01/09/20.
//  Copyright © 2020 prk. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var registeredUsers:[Users]?
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func login(_ sender: Any) {
        var username = txtUsername.text!
        var password = txtPassword.text!
        
        print("Username: \(username)")
        print("Password : \(password)")
        
        
//        if(username != "" && password != ""){
//            performSegue(withIdentifier: "login_to_home", sender: nil)
//        }
        
        if(auth(username: username, password: password)){
            
            //MENTRIGGER SEGUE DARI LOGIN KE HOME
            performSegue(withIdentifier: "login_to_home", sender: nil)
            
        }
    }
    
    func auth(username : String!, password : String!) -> Bool {
        var status : Bool = false
        do{
            try registeredUsers = context.fetch(Users.fetchRequest())
            
            if(registeredUsers != nil){
                for item in registeredUsers! {
                    if(item.username == username && item.password == password){
                        print("Username: \(username)")
                        print("Pass: \(password)")
                        status = true
                        break;
                    }
                }
            }
            
        } catch {
            print(error)
            status = false
        }
        
        return status
    }

    
    @IBAction func register(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let id = segue.identifier
        
        if(id != nil){
            if(id == "login_to_home"){
                let vc = segue.destination as! HomeViewController
                
                vc.address = "Jl. Angka"
                vc.email = "angka@gmail.com"
                vc.fullName = "Mr Angka"
                
            }
        }
        
        
    }
    
    
    @IBAction func backToLogin(segue: UIStoryboardSegue){
        
    }


}

