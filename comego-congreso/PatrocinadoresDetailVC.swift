    //
//  PatrocinadoresDetailVC.swift
//  flasog
//
//  Created by Jonathan Horta on 8/3/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit
import WebKit

class PatrocinadoresDetailVC: UIViewController {

    @IBOutlet weak var webViewContainer: UIView!
    
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string:self.url){
    //            self.webView.loadRequest(URLRequest(url: url))
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
