//
//  SalonDetailVC.swift
//  flasog
//
//  Created by Jonathan Horta on 8/2/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit

class SalonDetailVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    
    var imageName = ""
    var title_t = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = title_t
        self.image.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.image
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
