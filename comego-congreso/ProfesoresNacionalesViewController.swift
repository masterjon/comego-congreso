//
//  ProfesoresNacionalesViewController.swift
//  comego
//
//  Created by Jonathan Horta on 5/12/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ProfesoresNacionalesViewController: UIViewController, UITableViewDataSource {
    
    class func create(storyboardId:String) -> ProfesoresNacionalesViewController {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! ProfesoresNacionalesViewController
    }
    
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    let url = "\(getApiBaseUrl())profesores/1/"
    
    var profesores = [Profesor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(url).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                let profesoresJSON = JSON(response.value ?? [])
                for item in profesoresJSON["profesores"].arrayValue{
                    let fullName = "\(item["nombres"].string!) \(item["apellidos"].string!)"
                    let profesor = Profesor()
                    profesor.title = fullName
                    profesor.imageUrl = item["picture"].string ?? ""
                    profesor.descripcion = item["description"].string ?? ""
                    self.profesores.append(profesor)
                }
                self.tableView.reloadData()
                self.loadingIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
            
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profesores.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel{
            label.text = profesores[indexPath.row].title
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PorofesorDetalleViewController{
            let index = self.tableView.indexPathForSelectedRow
            if let row = index?.row{
                vc.profesor = self.profesores[row]
            }
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
