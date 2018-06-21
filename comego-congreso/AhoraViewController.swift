//
//  AhoraViewController.swift
//  comego-congreso
//
//  Created by Jonathan Horta on 6/13/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class AhoraViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var emptyLabel: UILabel!
    let url = "\(getApiBaseUrl())actividades_all/"
    var list : [ProgramItem] = []
    var listNow : [[ProgramItem]] = []
    var timerTest : Timer?

    let sections = ["En este momento", "A continuación..."]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        startTimer()
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopTimerTest()
    }
    func startTimer() {
        
        if timerTest == nil {
            timerTest =  Timer.scheduledTimer(timeInterval: 10,
                                              target: self,
                                              selector: #selector(self.updateItems),
                                              userInfo: nil,
                                              repeats: true)
        }
    }
    func stopTimerTest() {
        if timerTest != nil {
            timerTest?.invalidate()
            timerTest = nil
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listNow[section].count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = listNow[indexPath.section][indexPath.row]
        cell.backgroundColor = UIColor(hex: row.color)
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
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        label.text = sections[section]
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProgramItemDetailVC{
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                vc.programItem = listNow[indexPath.section][indexPath.row]
                
            }
        }

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "detailSegue"{
            if let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell){
               print(indexPath)
                let item = self.listNow[indexPath.section][indexPath.row]
                if item.category == "Otro"{
                    return false
                }
            }
        }
        
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadItems(){
        print("loaditems")
        for _ in sections{
            listNow.append([ProgramItem]())
        }
        
        
        Alamofire.request(url).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                let actJSON = JSON(response.value ?? [])
                for item in actJSON.arrayValue{
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
                    actividad.color = item["color"].string ?? "#ffffff"
                    for presentacionItem in item["presentaciones"].arrayValue{
                        let presentacion = Presentacion()
                        presentacion.id = presentacionItem["id"].int!
                        presentacion.title = presentacionItem["title"].string ?? ""
                        presentacion.profesor = presentacionItem["doctor"].string ?? ""
                        presentacion.pdf = presentacionItem["pdf"].string ?? ""
                        presentacion.horario = presentacionItem["horario"].string ?? ""
                        actividad.presentaciones.append(presentacion)
                    }
                    self.list.append(actividad)
                }
                self.updateItems()
                self.loadingIndicator.stopAnimating()
                //print(self.list)
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    @objc func updateItems(){
        print("update")
        listNow[0] = []
        listNow[1] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxxxx"
        for actividad in list{
            
            if let dateSt = dateFormatter.date(from: actividad.dateStart), let dateEn = dateFormatter.date(from: actividad.dateEnd)  {
                let dateNextLimit = dateEn.addingTimeInterval(120.0 * 60.0)
                let datePrevtLimit = dateSt.addingTimeInterval(120.0 * 60.0 * -1)
                let currentDate = Date()
                if currentDate >= dateSt && currentDate <= dateEn{
                    print(currentDate)
                    print(dateSt)
                    print(dateEn)
                    self.listNow[0].append(actividad)
                }
                if currentDate < dateSt && dateEn < dateNextLimit && currentDate > datePrevtLimit{
                    
                    self.listNow[1].append(actividad)
                }
                
                
            }
        }
        self.tableView.reloadData()
        if self.listNow[0].isEmpty && self.listNow[1].isEmpty{
            self.emptyLabel.isHidden = false
        }
        else{
            self.emptyLabel.isHidden = true
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
