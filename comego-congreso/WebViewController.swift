//
//  WebViewController.swift
//  comego
//
//  Created by Jonathan Horta on 5/22/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var webViewContainer: UIView!
//    @IBOutlet var webView: UIWebView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    var webUrl = ""
    var hideLoading = false
    class func create(storyboardId:String) -> WebViewController {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: storyboardId) as! WebViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hideLoading{
            self.loadingIndicator.stopAnimating()
        }
        if let url = URL(string:self.webUrl){
            //self.webView.loadRequest(URLRequest(url: url))
            let webView = WKWebView(frame: CGRect(x:20,y:20,width:webViewContainer.frame.size.width, height:webViewContainer.frame.size.height))
            webView.load(URLRequest(url: url))
           webViewContainer.addSubview(webView)
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
