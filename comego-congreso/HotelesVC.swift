//
//  HotelesVC.swift
//  flasog
//
//  Created by Jonathan Horta on 7/25/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit

class HotelesVC: UITableViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var hotelLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    
    class func create(storyboardId:String) -> HotelesVC {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! HotelesVC
    }
    
    let items = [["nombre":"Grand Fiesta Americana Coral Beach Cancún",
                  "image":"HotelC1",
                  "web":"http://bit.ly/2pwvKOO",
                  "direccion":"Blvd. Kukulcán Km 9.5, Zona Hotelera, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2pzFvf5"],
                 ["nombre":"Krystal Grand Punta Cancún",
                  "image":"HotelC2",
                  "web":"http://bit.ly/2q3EfSz",
                  "direccion":"Blvd. Kukulcán Km. 8.5, Zona Hotelera, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2r21e0r"],
                 ["nombre":"Krystal Hotel & Resort Cancún",
                  "image":"HotelCE1",
                  "web":"http://bit.ly/2qoBPRJ",
                  "direccion":"Blvd. Kukulcán km 9, lotes 9 y 9ª, Zona Hotelera, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2q3oRrB"],
                 ["nombre":"Intercontinental Hotels & Resorts Cancún",
                  "image":"HotelCE2",
                  "web":"http://bit.ly/2phPXfd",
                  "direccion":"Blvd. Kukulcán KM 7.5, Zona Hotelera, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2pkmhy2"],
                 ["nombre":"Aloft Cancún",
                  "image":"HotelCE3",
                  "web":"http://bit.ly/2pwothR",
                  "direccion":"Blvd. Kukulcán KM 9, MZ 48 L-8-1, Zona Hotelera, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2qrQSdi"],
                 ["nombre":"Beachscape KIN HA Villas & Suites Cancún",
                  "image":"HotelCE4",
                  "web":"http://bit.ly/2q1erIW",
                  "direccion":"Blvd. Kukulcán Km. 8.5, Zona Hotelera, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2pzP6Tj"],
                 ["nombre":"Real Inn Cancún",
                  "image":"HotelCE5",
                  "web":"http://bit.ly/2qZnzfc",
                  "direccion":"Km 5.5, Blvd. Kukulcán, Zona, Zona Hotelera, Cancún, Quintana Roo.",
                  "link":"http://bit.ly/2qTwHF0"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        if let locBtn = cell.viewWithTag(4) as? UIButton{
            locBtn.titleLabel?.text = items[indexPath.row]["direccion"]
        }
        //        if let loc = cell.viewWithTag(3) as? UILabel{
        //            loc.text = items[indexPath.row]["direccion"]
        //        }
        //        if let loc = cell.viewWithTag(4) as? UILabel{
        //            loc.text = items[indexPath.row]["direccion"]
        //        }
        
        return cell
    }
    
    
    
    @IBAction func reserveBtn(_ sender: Any) {
        let url = URL(string: "http://bit.ly/29xJyE4")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func websiteBtn(_ sender: UIButton) {
        let view = self.view as! UITableView
        let touchPoint = sender.convert(CGPoint.zero, to: self.view)
        
        let clickedButtonIndexPath = view.indexPathForRow(at: touchPoint)
        if let row = clickedButtonIndexPath?.row{
            let url = URL(string: items[row]["web"]!)!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func locationButton(_ sender: UIButton) {
        
        let view = self.view as! UITableView
        let touchPoint = sender.convert(CGPoint.zero, to: self.view)
        
        let clickedButtonIndexPath = view.indexPathForRow(at: touchPoint)
        if let row = clickedButtonIndexPath?.row{
            let url = URL(string: items[row]["link"]!)!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
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
     tableView.deleteRows(at: [indexPat  h], with: .fade)
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
