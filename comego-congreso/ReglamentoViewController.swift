//
//  ReglamentoViewController.swift
//  comego-congreso
//
//  Created by Jonathan Horta on 6/19/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit
import WebKit

class ReglamentoViewController: UIViewController {
//    @IBOutlet var webView: UIWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    let url = "https://online.flippingbook.com/view/219779/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let url = URL(string:self.url){
//            self.webView.loadRequest(URLRequest(url: url))
//        }
        if let pdfURL = Bundle.main.url(forResource: "Reglamento", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                let webView = WKWebView(frame: CGRect(x:20,y:20,width:view.frame.size.width-40, height:view.frame.size.height-40))
                webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
               view.addSubview(webView)

            }
            catch {
                // catch errors here
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
