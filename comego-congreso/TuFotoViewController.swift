//
//  TuFotoViewController.swift
//  flasog
//
//  Created by Jonathan Horta on 9/27/17.
//  Copyright © 2017 iddeas. All rights reserved.
//

import UIKit

class TuFotoViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var pickMethod : String?
    var userImage: UIImage!
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectImage()
        
        // Do any additional setup after loading the view.
    }
    
    func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        if pickMethod == "PhotoLibrary" {
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        }
        else{
            picker.sourceType = UIImagePickerControllerSourceType.camera
        }
        
        self.present(picker, animated: true, completion: nil)
        
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.userImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageView.image = self.userImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func mergeIMages() -> UIImage{
        
        //let bottomImage = self.userImage
        //let topImage = UIImage(named: "1-roseberg-bg")!
        //let newSize = CGSizeMake(750,1000)
        
        let canvasView =  self.view.viewWithTag(5)!
        let newSize = CGSize(width: canvasView.bounds.size.width,height: canvasView.bounds.size.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0.0)
        
        //let areaSize = CGRectMake(0,0,newSize.width,newSize.height)
        //bottomImage.drawInRect(areaSize)
        //topImage.drawInRect(areaSize, blendMode:CGBlendMode.Normal ,alpha:1)
        
        
        canvasView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let newImage =  UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
        
    }
    
    @IBAction func saveImg(_ sender: UIButton) {
        let newImage = mergeIMages()
        UIImageWriteToSavedPhotosAlbum(newImage, self, #selector(TuFotoViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @IBAction func shareImg(_ sender: UIButton) {
        let shareText = "#XXIIICongresoCoMEGO"
        let mergedIMage = self.mergeIMages()
        let items2Sahre = [mergedIMage,shareText] as [Any]
        let shareVC = UIActivityViewController(activityItems: items2Sahre, applicationActivities: nil)
        shareVC.excludedActivityTypes = [UIActivityType.postToWeibo,
                                         UIActivityType.print,
                                         UIActivityType.copyToPasteboard,
                                         UIActivityType.assignToContact,
                                         UIActivityType.saveToCameraRoll,
                                         UIActivityType.addToReadingList,
                                         UIActivityType.postToFlickr,
                                         UIActivityType.postToVimeo,
                                         UIActivityType.postToTencentWeibo,
                                         UIActivityType.airDrop]
        self.present(shareVC, animated: true, completion: nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer) {
        
        if error == nil
        {
            let ac = UIAlertController(title: "Imagen guardada", message: "", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
        else
        {
            let ac = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
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
