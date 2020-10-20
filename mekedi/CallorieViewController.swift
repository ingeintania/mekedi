//
//  CallorieViewController.swift
//  mekedi
//
//  Created by prk on 04/09/20.
//  Copyright © 2020 prk. All rights reserved.
//

import UIKit

class CallorieViewController: UIViewController {
    
    @IBOutlet weak var txtPlate: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultRecommendation: UILabel!
    
    var Answer: Int!
    var Recom: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func multiply(_ sender: Any) {
        var a = Int(txtPlate.text!)
        var b = Int(txtWeight.text!)
        
        Answer = a! * b!
        result.text = "Total Callorie is \(Answer) kkal"
    }
    
    @IBAction func recommendation(_ sender: Any) {
        if(Answer > 1000){
            Recom = Answer - 500
            resultRecommendation.text = "\(Recom) kkal"
        }else{
            resultRecommendation.text = "\(Answer) kkal"
        }
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
