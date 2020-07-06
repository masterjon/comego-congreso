//
//  ProgramaTextoViewController.swift
//  comego-congreso
//
//  Created by Jonathan Horta on 6/19/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit

class ProgramaTextoViewController: UIViewController {

    var cat:ProgramCat!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProgramaCatDetailVC{
            vc.cat = cat
            print("cat")
            print(cat)
        }
        print("cat")
        print(cat)
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
