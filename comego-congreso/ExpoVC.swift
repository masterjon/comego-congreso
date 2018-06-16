//
//  ExpoVC.swift
//  flasog
//
//  Created by Jonathan Horta on 8/3/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit

class ExpoVC: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var imageView: UIImageView!
    class func create(storyboardId:String) -> ExpoVC {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! ExpoVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ExpoVC.didTap))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    @objc func didTap() {
        if self.scrollView.zoomScale > self.scrollView.minimumZoomScale{
            self.scrollView.setZoomScale(self.scrollView.minimumZoomScale, animated: true)
        }
        else{
            self.scrollView.setZoomScale(self.scrollView.maximumZoomScale, animated: true)
        }
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
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
