//
//  LugaresVC.swift
//  flasog
//
//  Created by Jonathan Horta on 7/29/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit

class LugaresVC: UITableViewController {
    
    class func create(storyboardId:String) -> LugaresVC {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! LugaresVC
    }
    
    let items = [["nombre":"La Isla Shopping Village Cancún",
                  "image":"1Chapultepec",
                  "web":"http://www.laislacancun.mx",
                  "direccion":"Blvd. Kukulcán, Km. 12.5. Zona Hotelera, Cancún.",
                  "link":"http://bit.ly/2q4nW9J"],
                 ["nombre":"Playa Delfines (Mirador Cancún)",
                  "image":"2CentroHistorico",
                  "web":"",
                  "direccion":"Blvd. Kukulcán, Km. 19.5, Zona Hotelera, Cancún.",
                  "link":"http://bit.ly/2q4k74e"],
                 ["nombre":"Glorieta del Ceviche ",
                  "image":"3Xochimilco",
                  "web":"",
                  "direccion":"Av. Cobá con Tulum, Centro, Cancún.",
                  "link":"http://bit.ly/2r3acdE"],
                 ["nombre":"Puerto Cancún, Marina Town Center",
                  "image":"4Coyoacan",
                  "web":"https://www.marinatowncenter.com/",
                  "direccion":"Blvd. Kukulcán, Km. 1.5, Zona Hotelera, Cancún.",
                  "link":"http://bit.ly/2tLaVBJ"],
                 ["nombre":"Mercado 28 (Mercado de artesanías)",
                  "image":"4MuseoAntropologia",
                  "web":"",
                  "direccion":"Sm 28 Mz. 13, Xel-ha, 28, C.P. 77509 Cancún, Quintana Roo. ",
                  "link":"http://bit.ly/2q4A7TT"],
                 ["nombre":"Museo Maya Cancún",
                  "image":"6MuseoSoumaya",
                  "web":"",
                  "direccion":"Blvd. Kukulcán, Km. 16.5, Zona Hotelera, C.P. 77500 Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2r1pTBu"],
                 ["nombre":"MUSA (Museo Subacuático de Arte)",
                  "image":"7MuseoNacionalHistoria",
                  "web":"http://www.musamexico.org/es/",
                  "direccion":"Blvd. Kukulcán, Km. 15.3, Zona Hotelera, C.P. 77500 Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2qUiZkY"],
                 ["nombre":"Torre Panorámica Cancún",
                  "image":"8PalacioMineria",
                  "web":"http://www.xcaret.com.mx/torre-escenica.php",
                  "direccion":"Blvd. Kukulcán, Km. 9.7, Zona Hotelera, C.P. 77500, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2snPpEn"],
                 ["nombre":"Torre Panorámica Cancún",
                  "image":"9Reforma222",
                  "web":"http://www.xcaret.com.mx/torre-escenica.php",
                  "direccion":"Blvd. Kukulcán, Km. 9.7, Zona Hotelera, C.P. 77500, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2snPpEn"],
                 ["nombre":"Torre Panorámica Cancún",
                  "image":"10PlazaAntara",
                  "web":"http://www.xcaret.com.mx/torre-escenica.php",
                  "direccion":"Blvd. Kukulcán, Km. 9.7, Zona Hotelera, C.P. 77500, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2snPpEn"],
                 ["nombre":"Torre Panorámica Cancún",
                  "image":"11PlazaGardenSantaFe",
                  "web":"http://www.xcaret.com.mx/torre-escenica.php",
                  "direccion":"Blvd. Kukulcán, Km. 9.7, Zona Hotelera, C.P. 77500, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2snPpEn"],
                 ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let img = cell.viewWithTag(1) as? UIImageView{
            img.image = UIImage(named: items[indexPath.row]["image"]!)
        }
        if let loc = cell.viewWithTag(2) as? UILabel{
            loc.text = items[indexPath.row]["direccion"]
        }
        
        var hidden = false
        if items[indexPath.row]["web"]?.characters.count == 0{
            hidden = true
        }
        
        
        print(indexPath.row)
        print(hidden)
        
        if let webLbl = cell.viewWithTag(4) as? UIButton{
            webLbl.isHidden = hidden
        }
        if let webIcn = cell.viewWithTag(5) as? UIImageView{
            webIcn.isHidden = hidden
        }
        //        if let loc = cell.viewWithTag(4) as? UILabel{
        //            loc.text = items[indexPath.row]["direccion"]
        //        }
        
        
        return cell
    }
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        if let link = items[indexPath.row]["link"]{
    //
    //            let url = URL(string: link)!
    //            if #available(iOS 10.0, *) {
    //                UIApplication.shared.open(url, options: [:], completionHandler: nil)
    //            } else {
    //                UIApplication.shared.openURL(url)
    //            }
    //        }
    //    }
    
    @IBAction func websiteBtn(_ sender: UIButton) {
        let view = self.view as! UITableView
        let touchPoint = sender.convert(CGPoint.zero, to: self.view)
        
        let clickedButtonIndexPath = view.indexPathForRow(at: touchPoint)
        if let row = clickedButtonIndexPath?.row{
            if let webLink = items[row]["web"]{
                if let url = URL(string: webLink){
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
            
            
        }
    }
    
    @IBAction func locationBtn(_ sender: UIButton) {
        let view = self.view as! UITableView
        let touchPoint = sender.convert(CGPoint.zero, to: self.view)
        
        let clickedButtonIndexPath = view.indexPathForRow(at: touchPoint)
        if let row = clickedButtonIndexPath?.row{
            if let webLink = items[row]["link"]{
                if let url = URL(string: webLink){
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
            
            
        }
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
