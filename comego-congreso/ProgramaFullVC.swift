//
//  ProgramaFullVC.swift
//  flasog
//
//  Created by Jonathan Horta on 8/5/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProgramaFullVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var days : [[String:Any]] = []
    var list : [[ProgramItem]] = []
    
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    let url = "\(getApiBaseUrl())actividades_all/"
    let months = ["Martes, 14 de Julio", "Miércoles, 15 de Julio","Jueves, 16 de Julio", "  Viernes, 17 de Julio"]
    
    class func create(storyboardId:String) -> ProgramaFullVC {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! ProgramaFullVC
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return months.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list[section].count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return months[section]
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        label.text = months[section]
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.backgroundColor = ColorPallete.DarkPrimaryColor
        
//        if section == 0{
//            return UIView(frame: CGRect.zero)
//        }
        return label
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0{
//            return 0
//        }
        return 30
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let title = view as? UITableViewHeaderFooterView{
            title.textLabel?.textColor =  ColorPallete.BlueColor
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = list[indexPath.section][indexPath.row]
        if let titleLabel = cell.viewWithTag(1) as? UILabel{
            titleLabel.text = row.title
        }
        if let cat = cell.viewWithTag(2) as? UILabel{
            if row.category == "Otro"{
                cat.text = ""
            }
            else{
                cat.text = row.category
            }
            
            
        }
        if let fechas = cell.viewWithTag(3) as? UILabel{
            fechas.text = dateFormatCustom(row.dateStart, row.dateEnd)
        }
        
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProgramItemDetailVC{
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                    vc.programItem = list[indexPath.section][indexPath.row]
                
            }
        }
//        if segue.identifier == "ShowTestSegue", let vc = segue.destination as? ProgramaTextoViewController{
//            let actividad = ProgramCat()
//            actividad.id = 7
//            actividad.title = "XIII Encuentro de Residentes"
//            actividad.color = "#9641a4"
//            vc.cat = actividad
//        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
            if let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell){
//                if indexPath.row == 0 && indexPath.section == 0 {
//                    return false
//                }
                let item = self.list[indexPath.section][indexPath.row]
                if item.category == "Otro"{
                    return false
                }
                
            }
        
        
      
        
        
        return true
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 && indexPath.section == 0{
//           performSegue(withIdentifier: "ShowTestSegue", sender: nil)
//        }
    }

    func loadItems(){
        

        
        for _ in months{
            list.append([ProgramItem]())
        }
        
        Alamofire.request(url).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                let actJSON = JSON(response.value ?? [])
                for item in actJSON.arrayValue{
                    guard let startDate = item["start_date"].string else{return}
                    guard let day = Int(dateFormatCustom3(startDate)) else{return}
                    var index = 0
                    switch day{
                    case 14:
                        index = 0
                    case 15:
                        index = 1
                    case 16:
                        index = 2
                    case 17:
                        index = 3
                    default:
                        index = 0
                    }
                    
                    let actividad = ProgramItem()
                    actividad.id = item["id"].int!
                    actividad.title = item["title"].string!
                    actividad.desc = item["description"].string!
                    actividad.dresscode = item["dress_code"].string ?? ""
                    actividad.room = item["salon"].string ?? ""
                    actividad.dateStart = item["start_date"].string ?? ""
                    actividad.dateEnd = item["end_date"].string ?? ""
                    actividad.academicProgramUrl = item["academic_program_url"].string ?? ""
                    actividad.inscriptionUrl = item["inscription_url"].string ?? ""
                    actividad.category = item["category"].string ?? ""
                    for presentacionItem in item["presentaciones"].arrayValue{
                        let presentacion = Presentacion()
                        presentacion.id = presentacionItem["id"].int!
                        presentacion.title = presentacionItem["title"].string ?? ""
                        presentacion.profesor = presentacionItem["doctor"].string ?? ""
                        presentacion.pdf = presentacionItem["pdf"].string ?? ""
                        presentacion.horario = presentacionItem["horario"].string ?? ""
                        actividad.presentaciones.append(presentacion)
                    }
                    self.list[index].append(actividad)
                }
                self.tableView.reloadData()
                self.loadingIndicator.stopAnimating()
                print(self.list)
            case .failure(let error):
                print(error)
            }
            
        }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
 
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
