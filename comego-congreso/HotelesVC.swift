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
    
    let items = [
        [
            ["nombre":"Holiday Inn Express WTC CDMX",
                  "image":"HotelC1",
                  "web":"https://www.ihg.com/holidayinnexpress/hotels/us/es/mexico/mexhm/hoteldetail",
                  "direccion":"Dakota 95, Nápoles, 03810 Ciudad de México, CDMX",
                  "link":"https://www.google.com/maps/place/Holiday+Inn+Express+%26+Suites+Mexico+City+at+WTC/@19.3955505,-99.1744639,17z/data=!4m16!1m8!3m7!1s0x85d1ff70ef829b89:0xd2e635ba71228!2sHoliday+Inn+Express+%26+Suites+Mexico+City+at+WTC!5m1!1s2018-07-07!8m2!3d19.3956485!4d-99.1747141!3m6!1s0x85d1ff70ef829b89:0xd2e635ba71228!5m1!1s2018-07-07!8m2!3d19.3956485!4d-99.1747141"],
                 ["nombre":"Crowne Plaza Hotel de México",
                  "image":"HotelC2",
                  "web":"http://www.hoteldemexico.com/",
                  "direccion":"Crowne: Calle Dakota 95, Nápoles, 03810 Benito Juárez, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Crowne+Plaza+Hotel+de+M%C3%A9xico/@19.3961095,-99.1766256,17z/data=!3m1!4b1!4m7!3m6!1s0x85ce013fa8989a07:0x62791b31b80a1cb0!5m1!1s2018-06-30!8m2!3d19.3961095!4d-99.1744369"]
        ],
        [
                 ["nombre":"Isaaya Hotel Boutique",
                  "image":"HotelCE1",
                  "web":"https://www.isaayahotelboutique.mx/",
                  "direccion":"Isaaya: Dakota 155, Nápoles, 03810 Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Isaaya+Hotel+Boutique+by+WTC/@19.3941423,-99.1777606,17z/data=!3m1!4b1!4m7!3m6!1s0x85d1ff71b74ebe23:0x18be5eeaf2ee2b77!5m1!1s2018-06-23!8m2!3d19.3941423!4d-99.1755719"],
                 ["nombre":"Filadelfia Suites Hotel Boutique",
                  "image":"HotelCE2",
                  "web":"http://www.suitesfiladelfia.com.mx",
                  "direccion":"Filadelfia Suites: Filadelfia 42, Nápoles, 03810 Ciudad de México, CDMX ",
                  "link":"https://www.google.com.mx/maps/place/Filadelfia+Suites+Hotel+Boutique/@19.3932856,-99.1753246,14z/data=!4m10!1m2!2m1!1shoteles+cercanos+wtc!3m6!1s0x85d1ff71a7d7f571:0xe9d6726422a57fbc!5m1!1s2018-06-18!8m2!3d19.3931276!4d-99.1753647"],
                 ["nombre":"J. Towers Hotel",
                  "image":"HotelCE3",
                  "web":"http://www.jtowers.com.mx/",
                  "direccion":"JTowers: Texas 17, Nápoles, 03810 Delegación Benito Juarez, CDMX ",
                  "link":"https://www.google.com.mx/maps/place/J.+Towers+Hotel/@19.3928526,-99.1788238,17z/data=!3m1!4b1!4m7!3m6!1s0x85d1ff7057c207db:0x834310139536f161!5m1!1s2018-06-23!8m2!3d19.3928526!4d-99.1766351"],
                 ["nombre":"The Host suites",
                  "image":"HotelCE4",
                  "web":"http://www.thehostsuites.com/",
                  "direccion":"Host: Av. Magdalena 311, Col del Valle Nte, 03100 Mexico City, CDMX ",
                  "link":"https://www.google.com.mx/maps/place/The+Host+Business+Suites/@19.392075,-99.1742496,17z/data=!3m1!4b1!4m7!3m6!1s0x85d1ff73c72bffff:0x45a9de83587a59ad!5m1!1s2018-06-15!8m2!3d19.392075!4d-99.1720609"],
                 ["nombre":"Hotel Novit",
                  "image":"HotelCE5",
                  "web":"http://www.hotelnovit.com",
                  "direccion":"Novit: Insurgentes Sur 635, Nápoles, 03810 Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Hotel+Novit/@19.3960546,-99.1741898,17z/data=!3m1!4b1!4m7!3m6!1s0x85d1ff72755e72f7:0xbfc2cef1476e4b38!5m1!1s2018-06-15!8m2!3d19.396094!4d-99.171829"]
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
 
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        if section == 0{
          label.text = "Hoteles en Convenio"
        }
        else{
            label.text = "Hoteles Cercanos"
        }
        
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.backgroundColor = ColorPallete.DarkPrimaryColor
        
        //        if section == 0{
        //            return UIView(frame: CGRect.zero)
        //        }
        return label
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.section][indexPath.row]
        if let img = cell.viewWithTag(1) as? UIImageView{
            img.image = UIImage(named: item["image"]!)
        }
        if let loc = cell.viewWithTag(2) as? UILabel{
            loc.text = item["direccion"]
        }
        if let locBtn = cell.viewWithTag(4) as? UIButton{
            locBtn.titleLabel?.text = item["direccion"]
        }
        
        if let hotelimg = cell.viewWithTag(10) as? UIImageView{
            if indexPath.section == 1{
                hotelimg.isHidden = true
                
            }
            else{
                hotelimg.isHidden = false
            }
            
        }
        if let hotelBtn = cell.viewWithTag(3) as? UIButton{
            if indexPath.section == 1{
                hotelBtn.isHidden = true
            }
            else{
                hotelBtn.isHidden = false
            }
            
        }
        
        if let loc = cell.viewWithTag(9) as? UILabel{
            loc.text = item["nombre"]
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
        let url = URL(string: "http://www.comego.org.mx/regional/index.php/hospedaje")!
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
        if let row = clickedButtonIndexPath?.row, let section = clickedButtonIndexPath?.section{
            let url = URL(string: items[section][row]["web"]!)!
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
        
        if let row = clickedButtonIndexPath?.row, let section = clickedButtonIndexPath?.section{
            let url = URL(string: items[section][row]["link"]!)!
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
