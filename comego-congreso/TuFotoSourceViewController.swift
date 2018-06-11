//
//  TuFotoSourceViewController.swift
//  flasog
//
//  Created by Jonathan Horta on 9/27/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit

class TuFotoSourceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoLibrary" || segue.identifier == "Camera"{
            let detalleViewcontroller = segue.destination as! TuFotoViewController
            
            detalleViewcontroller.pickMethod = segue.identifier
        }
        
        
        
    }
    

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
