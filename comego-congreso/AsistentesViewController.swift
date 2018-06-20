//
//  AsistentesViewController.swift
//  comego
//
//  Created by Jonathan Horta on 5/12/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class AsistentesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    let url = "\(getApiBaseUrl())asistentes/"
    var profesores = [(name:String,folio:Int)]()
    var dictt=[String:[String]]()
    var nd = [(key: String, value: [String])]()


    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(url).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                let profesoresJSON = JSON(response.value ?? [])
                for item in profesoresJSON.arrayValue{
                    let fullName = item["nombre"].string!
                    let folio = item["folio"].int!
                    self.profesores.append((fullName,folio))
                }
                for item in self.profesores{
                    if let c = item.name.folding(options: [.diacriticInsensitive, .widthInsensitive, .caseInsensitive] , locale: .current).first{
                        let key = "\(c)".uppercased()
                        if let _ = self.dictt[key]{
                            self.dictt[key]?.append("\(item.folio) - \(item.name)")
                        }
                        else{
                            self.dictt[key] = []
                            self.dictt[key]?.append("\(item.folio) - \(item.name)")
                        }
                    }
                }
                self.nd = self.dictt.sorted(by: { $0.0 < $1.0 })
                self.tableView.reloadData()
                self.loadingIndicator.stopAnimating()
                
            case .failure(let error):
                print(error)
            }
            
        }
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return nd.count
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dictt.keys.sorted()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width-15, height: 30))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        label.text = nd[section].key
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = .white
        label.backgroundColor = ColorPallete.DarkPrimaryColor
        view.addSubview(label)
        return view
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nd[section].value.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel{
            label.text = nd[indexPath.section].value[indexPath.row]
        }
        
        return cell
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
