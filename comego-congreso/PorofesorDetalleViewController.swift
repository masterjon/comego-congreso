//
//  PorofesorDetalleViewController.swift
//  comego-congreso
//
//  Created by Jonathan Horta on 6/7/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire

class PorofesorDetalleViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabelView: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var imageHeightConstraint: NSLayoutConstraint!
    
    var profesor:Profesor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let prof = profesor{
            self.nameLabelView.text = prof.title
            let htmlDesc = "<style>body{font-family:Helvetica;font-size:18px;}</style>\(prof.descripcion)"
            self.descriptionTextView.attributedText = htmlDesc.htmlToAttributedString
            if prof.imageUrl.isEmpty{
                self.imageHeightConstraint.constant = 0
            }
            else{
                Alamofire.request(prof.imageUrl).response { (response) in
                    self.imageView.image = UIImage(data: response.data!)
                }
            }
            
        }
        // Do any additional setup after loading the view.
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



