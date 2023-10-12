//
//  TrabajosViewController.swift
//  comego
//
//  Created by Jonathan Horta on 5/23/18.
//  Copyright © 2018 iddeas. All rights reserved.
//

import UIKit
import Segmentio

class TrabajosViewController: UIViewController {
    var segmentioStyle = SegmentioStyle.onlyLabel
    var segmentioView: Segmentio!

    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentioViewRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        
        segmentioView = Segmentio(frame: segmentioViewRect)
        segmentioView.backgroundColor = ColorPallete.RedColor
        view.addSubview(segmentioView)
        self.setupSegmentioView()
        self.setupScrollView()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupSegmentioView() {
        segmentioView.setup(
            content: segmentioContent(),
            style: segmentioStyle,
            options: segmentioOptions()
        )
        segmentioView.selectedSegmentioIndex = 0
        segmentioView.valueDidChange = { segmentio, segmentIndex in
            print("Selected item: ", segmentIndex)
            if let scrollViewWidth = self.scrollView?.frame.width {
                let contentOffsetX = scrollViewWidth * CGFloat(segmentIndex)
                self.scrollView?.setContentOffset(
                    CGPoint(x: contentOffsetX, y: 0),
                    animated: true
                )
                print("Selected item: ", segmentIndex)
                print(scrollViewWidth)
                print(contentOffsetX)
            }
        }
    }
    private func segmentioContent() -> [SegmentioItem] {
        var items : [SegmentioItem] = []
        return [
            SegmentioItem(title: "Carteles participación", image: nil),
            SegmentioItem(title: "Carteles concurso", image: nil ),
            SegmentioItem(title: "Trabajos libres", image: nil ),
            SegmentioItem(title: "Videos concurso", image: nil ),
        ]
    }
    private func segmentioOptions() -> SegmentioOptions {
        var imageContentMode = UIViewContentMode.center
        switch segmentioStyle {
        case .imageBeforeLabel, .imageAfterLabel:
            imageContentMode = .scaleAspectFit
        default:
            break
        }
        
        return SegmentioOptions(
            backgroundColor:  .clear,
            maxVisibleItems: 3,
            scrollEnabled: true,
            indicatorOptions: segmentioIndicatorOptions(),
            horizontalSeparatorOptions: SegmentioHorizontalSeparatorOptions(type: .bottom, height: 0, color: .gray),
            verticalSeparatorOptions: nil,
            imageContentMode: imageContentMode,
            labelTextAlignment: .center,
            labelTextNumberOfLines: 0,
            segmentStates: segmentioStates(),
            animationDuration:0.1
        )
    }
    private func segmentioStates() -> SegmentioStates {
        let font = UIFont.systemFont(ofSize:14)
        return SegmentioStates(
            defaultState: segmentioState(
                backgroundColor: ColorPallete.TransparentColor,
                titleFont: font,
                titleTextColor: .white
            ),
            selectedState: segmentioState(
                backgroundColor: ColorPallete.TransparentColor,
                titleFont: font,
                titleTextColor: ColorPallete.AccentColor
            ),
            highlightedState: segmentioState(
                backgroundColor: ColorPallete.TransparentColor,
                titleFont: font,
                titleTextColor: ColorPallete.AccentColor
            )
        )
    }
    private func segmentioState(backgroundColor: UIColor, titleFont: UIFont, titleTextColor: UIColor) -> SegmentioState {
        return SegmentioState(backgroundColor: backgroundColor, titleFont: titleFont, titleTextColor: titleTextColor)
    }
    
    private func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 3,
            color: ColorPallete.AccentColor
        )
    }
    
    private func preparedViewControllers() -> [WebViewController] {
        
        let tab1 = WebViewController.create(storyboardId:"WebView")
        tab1.webUrl = "https://congresovirtualcomego.com/media/ListadoConcurso_compressed.pdf"
        let tab2 = WebViewController.create(storyboardId:"WebView")
        tab2.webUrl = "https://congresovirtualcomego.com/media//ListadoPresentacion_compressed.pdf"
        
        let tab3 = WebViewController.create(storyboardId:"WebView")
        tab3.webUrl = "https://congresovirtualcomego.com/media/Listado_de_trabajos_libres.pdf"
        
        let tab4 = WebViewController.create(storyboardId:"WebView")
        tab4.webUrl = "https://congresovirtualcomego.com/media/Listado_de_Videos.pdf"
        
        
        return [tab1,tab2,tab3,tab4]
        //        return viewcontrollers
    }
    
    private func selectedSegmentioIndex() -> Int {
        return 0
    }
    private func setupScrollView() {
        let viewControllers: [UIViewController] = self.preparedViewControllers()
        
        print(viewControllers.count)
        scrollView.contentSize = CGSize(
            width: UIScreen.main.bounds.width * CGFloat(viewControllers.count),
            height: scrollView.frame.height
        )
        
        
        for (index, viewController) in viewControllers.enumerated() {
            viewController.view.frame = CGRect(
                x: UIScreen.main.bounds.width * CGFloat(index),
                y: 0,
                width: scrollView.frame.width,
                height: scrollView.frame.height
            )
            addChildViewController(viewController)
            scrollView.addSubview(viewController.view, options: .useAutoresize) // module's extension
            viewController.didMove(toParentViewController: self)
        }
    }
    private func goToControllerAtIndex(index: Int) {
        segmentioView.selectedSegmentioIndex = index
    }
    
    
    
    
}

extension TrabajosViewController : UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = floor(scrollView.contentOffset.x / scrollView.frame.width)
        segmentioView.selectedSegmentioIndex = Int(currentPage)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 0)
    }
    
}
