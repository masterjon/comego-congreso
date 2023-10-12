//
//  CancunICCVC.swift
//  flasog
//
//  Created by Jonathan Horta on 8/2/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit
import ImageSlideshow
class CancunICCVC: UIViewController {
    
    
    @IBOutlet var slideshow: ImageSlideshow!
    let localSource = [ImageSource(imageString: "1Recinto")!,ImageSource(imageString: "2Recinto")!,ImageSource(imageString: "3Recinto")!, ImageSource(imageString: "4Recinto")!, ImageSource(imageString: "5Recinto")!]
    
    class func create(storyboardId:String) -> CancunICCVC {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! CancunICCVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            print("current page:", page)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(StaticTabViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    @IBAction func showMap(_ sender: UIButton) {
        let url = URL(string: "https://www.congresovirtualfemecog.com/")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func showMapLocation(_ sender: UIButton) {
        let url = URL(string: "https://goo.gl/maps/QLwsgypJmGGpaJve7")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
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
