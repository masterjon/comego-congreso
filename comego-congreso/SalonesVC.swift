//
//  SalonesVC.swift
//  flasog
//
//  Created by Jonathan Horta on 8/2/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit

class SalonesVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
   
    @IBOutlet var tableView: UITableView!
    
    class func create(storyboardId:String) -> SalonesVC {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! SalonesVC
    }
    
//    let items = [["image":"SalonForoCOMEGO",
//                  "image_big":"SalonForoCOMEGO",
//                  "title":"Salón Foro COMEGO",
//                  "subtitle":""],
//                 ["image":"SalonDianaLaCazadora",
//                  "image_big":"SalonDianaLaCazadora",
//                  "title":"Salón Diana La Cazadora",
//                  "subtitle":""],
//                 ["image":"SalonBellasArtes",
//                  "image_big":"SalonBellasArtes",
//                  "title":"Salón Bellas Artes",
//                  "subtitle":""],
//                ["image":"SalonAngel",
//                 "image_big":"SalonAngel",
//                 "title":"Salón Angel",
//                 "subtitle":""],
//                ["image":"SalonReforma",
//                 "image_big":"SalonReforma",
//                 "title":"Salón Reforma",
//                 "subtitle":""]
//                ]
    let items = [["image":"planoalta",
                      "image_big":"planoalta",
                      "title":"Planta alta",
                      "subtitle":""],
                     ["image":"planobaja",
                      "image_big":"planobaja",
                      "title":"Planta baja",
                      "subtitle":""],
                     ["image":"planomezzanine",
                      "image_big":"planomezzanine",
                      "title":"Mezzanine",
                      "subtitle":""]
                    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let title = cell.viewWithTag(2) as? UILabel{
            title.text = items[indexPath.row]["title"]
        }
        if let subtitle = cell.viewWithTag(3) as? UILabel{
            subtitle.text = items[indexPath.row]["subtitle"]
        }
        if let image = cell.viewWithTag(1) as? UIImageView{
            image.image = UIImage(named: items[indexPath.row]["image"]!)
        }
        
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SalonDetailVC
        let index = self.tableView.indexPathForSelectedRow
        if let row = index?.row{
            vc.imageName = items[row]["image_big"]!
            vc.title_t = items[row]["title"]!
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
