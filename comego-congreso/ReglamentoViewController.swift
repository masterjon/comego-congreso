//
//  ReglamentoViewController.swift
//  comego-congreso
//
//  Created by Jonathan Horta on 6/19/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit

class ReglamentoViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var webView: UIWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    let url = "https://online.flippingbook.com/view/886668/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string:self.url){
            self.webView.loadRequest(URLRequest(url: url))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingIndicator.stopAnimating()
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
