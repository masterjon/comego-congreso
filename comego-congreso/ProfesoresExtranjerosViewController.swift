//
//  ProfesoresExtranjerosViewController.swift
//  comego
//
//  Created by Jonathan Horta on 5/22/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ProfesoresExtranjerosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    class func create(storyboardId:String) -> ProfesoresExtranjerosViewController {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! ProfesoresExtranjerosViewController
    }

    @IBOutlet var tableView: UITableView!
    let url = "\(getApiBaseUrl())profesores/2/"
    var profesores = [Profesor]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(url).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                let profesoresJSON = JSON(response.value ?? [])
                for item in profesoresJSON["profesores"].arrayValue{
                    let profesor = Profesor()
                    profesor.title = item["nombres"].string!
                    profesor.imageUrl = item["picture"].string ?? ""
                    profesor.descripcion = item["description"].string ?? ""
                    self.profesores.append(profesor)
                }
                print(self.profesores)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profesores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let podcastItem =  profesores[indexPath.row]
        if let label = cell.viewWithTag(1) as? UILabel{
            label.text = podcastItem.title
        }
        if let imageView = cell.viewWithTag(2) as? UIImageView{
            Alamofire.request(podcastItem.imageUrl).response { response in
                imageView.image = UIImage(data: response.data!)
            }
            
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
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let title = view as? UITableViewHeaderFooterView{
            title.textLabel?.textColor =  ColorPallete.RedColor
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
