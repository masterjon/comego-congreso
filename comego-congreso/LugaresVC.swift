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
    
    let items = [["nombre":"Chapultepec",
                  "image":"1Chapultepec",
                  "web":"http://www.chapultepec.com.mx/index.asp",
                  "direccion":"Chapultepec: Bosque de Chapultepec, Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Bosque+de+Chapultepec/@19.4194865,-99.1916445,17z/data=!3m1!4b1!4m5!3m4!1s0x85d1ff574549573f:0x42e2e5c1a219c3af!8m2!3d19.4194815!4d-99.1894558"],
                 ["nombre":"Centro Histórico",
                  "image":"2CentroHistorico",
                  "web":"http://www.cultura.gob.mx/turismocultural/destino_mes/cd_mexico/ ",
                  "direccion":"Centro: Centro Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Centro+Hist%C3%B3rico,+Centro,+Ciudad+de+M%C3%A9xico,+CDMX/@19.4336922,-99.1541865,14z/data=!3m1!4b1!4m5!3m4!1s0x85d1f92d2e0e4dbd:0x905574a740c4893d!8m2!3d19.4361609!4d-99.1373136 "],
                 ["nombre":"Xochimilco",
                  "image":"3Xochimilco",
                  "web":"https://www.visitmexico.com/es/destinos-principales/ciudad-de-mexico/xochimilco",
                  "direccion":"Xochimilco: Calle del Mercado 133, Xaltocan, 16090 Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/EMBARCADERO+LAS+FLORES/@19.2514494,-99.0986158,15z/data=!4m12!1m6!3m5!1s0x85ce03f96e8b3591:0x403e0ee969ca8432!2sTrajineras+Xochimilco+M%C3%A1gico!8m2!3d19.251809!4d-99.093466!3m4!1s0x0:0x9a62260a269924db!8m2!3d19.2504695!4d-99.0942147 "],
                 ["nombre":"Coyoacán",
                  "image":"4Coyoacan",
                  "web":"https://centrodecoyoacan.mx",
                  "direccion":"Coyoacán: Centro de Coyoacán Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Coyoac%C3%A1n,+Ciudad+de+M%C3%A9xico,+CDMX/@19.3284731,-99.2924992,11z/data=!3m1!4b1!4m5!3m4!1s0x85ce002e11342fc3:0x9a2667d831d4e080!8m2!3d19.3437444!4d-99.1561883"],
                 ["nombre":"Museo Antroplogía",
                  "image":"4MuseoAntropologia",
                  "web":"www.mna.inah.gob.mx",
                  "direccion":"Museo Antropología: Paseo de la Reforma & Calzada Gandhi S/N, Chapultepec Polanco, Miguel Hidalgo, 11560 Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Museo+Nacional+de+Antropolog%C3%ADa/@19.4260082,-99.1884673,17z/data=!3m1!4b1!4m5!3m4!1s0x85d201b420c8c849:0x84231ae36f6ec524!8m2!3d19.4260032!4d-99.1862786"],
                 ["nombre":"Museo Soumaya",
                  "image":"6MuseoSoumaya",
                  "web":"http://www.museosoumaya.org",
                  "direccion":"Soumaya: Blvd. Miguel de Cervantes Saavedra 303, Granada, Miguel Hidalgo, 11529 Ciudad de México, CDMX",
                  "link":" https://www.google.com.mx/maps/place/Museo+Soumaya/@19.4406976,-99.2068888,17z/data=!3m1!4b1!4m5!3m4!1s0x85d2021a6e3a3d09:0x9372e2224c033cb3!8m2!3d19.4406926!4d-99.2047001"],
                 ["nombre":"Museo Nacional de Historia",
                  "image":"7MuseoNacionalHistoria",
                  "web":"http://www.mnh.inah.gob.mx/",
                  "direccion":"Museo nacional de historia: Primera Sección del Bosque de Chapultepec S/N, San Miguel Chapultepec I Sección, Bosque de Chapultepec I Secc, 11580 Miguel Hidalgo, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Museo+Nacional+de+Historia/@19.4204841,-99.1840123,17z/data=!3m1!4b1!4m5!3m4!1s0x85d1ff508b842711:0x98f8163aa6fa7c96!8m2!3d19.4204791!4d-99.1818236"],
                 ["nombre":"Palacio Minería",
                  "image":"8PalacioMineria",
                  "web":"http://www.palaciomineria.unam.mx/",
                  "direccion":"Palacio de Minería: Calle de Tacuba 5, Centro Histórico, Centro, 06000 Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Palacio+de+Miner%C3%ADa/@19.4358138,-99.1416986,17z/data=!3m1!4b1!4m5!3m4!1s0x85d1ff2b3f509719:0x7000a4a5482fcc53!8m2!3d19.4358088!4d-99.1395099"],
                 ["nombre":"Reforma 222",
                  "image":"9Reforma222",
                  "web":"Reforma 222: Colonia Juárez 06600 Ciudad de México, CDMX",
                  "direccion":"Reforma 222: Colonia Juárez 06600 Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Reforma+222+Centro+Financiero,+Ju%C3%A1rez,+06600+Ciudad+de+M%C3%A9xico,+CDMX/@19.428616,-99.1638557,17z/data=!3m1!4b1!4m5!3m4!1s0x85d1fed4c6178105:0x3ccb09543b7378a5!8m2!3d19.428611!4d-99.161667"],
                 ["nombre":"Plaza Antara",
                  "image":"10PlazaAntara",
                  "web":"http://www.antara.com.mx/",
                  "direccion":"Plaza Antara: Av. Ejército Nacional 843, Granada, 11520 Ciudad de México, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Antara+Fashion+Hall/@19.439336,-99.2044487,17z/data=!3m1!4b1!4m5!3m4!1s0x85d2021ad7d389b3:0xb83d3f5dc6bb9046!8m2!3d19.439331!4d-99.20226"],
                 ["nombre":"Plaza Garden Santa Fé",
                  "image":"11PlazaGardenSantaFe",
                  "web":"http://gardensantafe.com.mx",
                  "direccion":"Plaza Garden: Guillermo González Camarena 1205, Santa Fe, Zedec Sta Fé, 01210 Alvaro Obregon, CDMX",
                  "link":"https://www.google.com.mx/maps/place/Garden+Santa+Fe/@19.365225,-99.2668467,17z/data=!3m1!4b1!4m5!3m4!1s0x85d201adc9407555:0xee2e5e40136a8f08!8m2!3d19.36522!4d-99.264658"],
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
        if let loc = cell.viewWithTag(9) as? UILabel{
            loc.text = items[indexPath.row]["nombre"]
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
