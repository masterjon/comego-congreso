//
//  ProgramaCatDetailVC.swift
//  flasog
//
//  Created by Jonathan Horta on 8/4/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
extension Array {
    mutating func remove(at indexes: [Int]) {
        for index in indexes.sorted(by: >) {
            remove(at: index)
        }
    }
}

class ProgramaCatDetailVC: UIViewController, UITableViewDataSource,UITableViewDelegate  {

    var cat:ProgramCat!
    var days : [[String:Any]] = []
    var subCategories = [ProgramSubcategory]()
    
    let userDefaults = UserDefaults.standard
    let url = "\(getApiBaseUrl())actividades/"

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = cat.title
        self.titleLabel.textColor = UIColor(hex: cat.color)
 
        loadItems()
        // Do any additional setup after loading the view.
    }
    
    func loadItems(){

        Alamofire.request("\(url)\(cat.id)").validate().responseJSON { (response) in
            switch response.result{
            case .success:
                let catData = JSON(response.value!)
                
                for subCat  in catData["activity_category"].arrayValue{
                    let subCategory = ProgramSubcategory()
                    subCategory.id =  subCat["id"].int!
                    subCategory.title = subCat["title"].string!
                    for item in subCat["actividades"].arrayValue {
                        let actividad = ProgramItem()
                        actividad.catId = self.cat.id
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
                        subCategory.activities.append(actividad)
                    }
                    self.subCategories.append(subCategory)
                }
                
                
                self.tableView.reloadData()
                self.loadingIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
        
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return subCategories.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return subCategories[section].activities.count
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        label.text = subCategories[section].title
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = .white
        label.backgroundColor = UIColor(hex: cat.color)
        
        return label
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if subCategories.count < 2{
//            return 0
//        }
        return 30.00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let items = subCategories[indexPath.section].activities
        let item = items[indexPath.row]
        if let titleLbl = cell.viewWithTag(1) as? UILabel{
            titleLbl.text = item.title
        }
        if let dateLbl = cell.viewWithTag(2) as? UILabel{
            dateLbl.text = dateFormatCustom(item.dateStart,item.dateEnd)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProgramItemDetailVC
        if let indexPath = tableView.indexPathForSelectedRow{
            let items = subCategories[indexPath.section].activities
                vc.programItem = items[indexPath.row]
               
            
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
extension UIColor {
    convenience init(hex: String) {
        var hexnum = hex
        if !hex.isEmpty{
            hexnum.removeFirst()
        }
        let scanner = Scanner(string: hexnum)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
        
        
       
    }
}
