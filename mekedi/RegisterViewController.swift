//
//  RegisterViewController.swift
//  mekedi
//
//  Created by prk on 01/09/20.
//  Copyright © 2020 prk. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext 
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var agreement: UISwitch!
    
    func makeUIAlertController(msg:String) -> UIAlertController {
        let ac = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        return ac
    }
    
    @IBAction func register(_ sender: Any) {
        if(txtUsername.text?.count == 0){
            let ac = makeUIAlertController(msg: "Username must be filled")
            present(ac, animated: true, completion: nil)
        }else if(txtPassword.text?.count ?? 0 <= 10){
            let ac = makeUIAlertController(msg: "Password must be more than 10 characters")
            present(ac, animated: true, completion: nil)
        }else if(txtEmail.text?.contains("@") == false){
            let ac = makeUIAlertController(msg: "Email must contains @")
            present(ac, animated: true, completion: nil)
        }else if(txtAddress.text?.hasPrefix("Jl") == false){
            let ac = makeUIAlertController(msg: "Address must starts with 'Jl' ")
            present(ac, animated: true, completion: nil)
        }else if(agreement.isOn == false){
            let ac = makeUIAlertController(msg: "You must agree with Terms & Conditions")
            present(ac, animated: true, completion: nil)
        }else{
            let username = txtUsername.text!
            let password = txtPassword.text!
            let email = txtEmail.text!
            let address = txtAddress.text!
            
            let user = Users(context: self.context)
            
            user.username = username
            user.password = password
            user.email = email
            user.address = address
            
            
            do{
                try context.save()
                print("username: \(username)")
                print("password: \(password)")
            }catch{
                print(error)
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
