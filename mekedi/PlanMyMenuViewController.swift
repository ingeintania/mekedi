//
//  PlanMyMenuViewController.swift
//  mekedi
//
//  Created by prk on 03/09/20.
//  Copyright © 2020 prk. All rights reserved.
//

import UIKit
import CoreData

class PlanMyMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var theSpot = 0;

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        (cell.viewWithTag(1) as! UILabel).text = self.myItems[indexPath.row].name;
        
        (cell.viewWithTag(2) as! UILabel).text = self.myItems[indexPath.row].desc;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        theSpot = indexPath.row
        
        txtMenu.text = myItems[theSpot].name
        txtDesc.text = myItems[theSpot].desc
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var txtMenu: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
   
    @IBOutlet weak var table: UITableView!
    
    private var myItems:[Menu] = []
    
    @IBAction func add(_ sender: Any) {
        let name = txtMenu.text!
        let desc = txtDesc.text!

        let menu = Menu(context: self.context)

        menu.name = name
        menu.desc = desc

        do{
            try context.save()
            getData()
            self.table.reloadData()
        }catch{
            print(error)
        }
        
    }
    
    @IBAction func update(_ sender: Any) {
        let menu = myItems[theSpot] as NSManagedObject
        
        menu.setValue(txtMenu.text, forKey: "name")
        menu.setValue(txtDesc.text, forKey: "desc")
        
        do {
            try context.save()
            self.table.reloadData()
            txtMenu.text="";
            txtDesc.text="";
            
        } catch {
            let saveError = error as NSError
            print(saveError)
        }
        
    }
    
    @IBAction func del(_ sender: Any) {
        let menu = myItems[theSpot] as NSManagedObject
        
        context.delete(menu)
        
        do {
            try context.save()
            getData()
            self.table.reloadData()
            txtMenu.text="";
            txtDesc.text="";
            
        } catch {
            let saveError = error as NSError
            print(saveError)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        
        myItems = getData()
        
        print(myItems.count)
        
        // Do any additional setup after loading the view.
    }
    
    func getData() -> [Menu]!{
        
        do{
            let menu =  try self.context.fetch(Menu.fetchRequest()) as! [Menu]
            for m in menu {
                print(m.name!)
            }
            self.table.reloadData()
            return menu
        } catch{
            print(error)
        }
        return []
        
    }
    
}
