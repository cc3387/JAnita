//
//  YourFuture.swift
//  JeunessebyAnita
//
//  Created by Clement Chan on 11/15/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import UIKit

class YourFuture: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var Yourfuture: UILabel!
    @IBOutlet weak var RankDescription: UITextView!
    @IBOutlet weak var Back: UILabel!

    /////////////////////////////////////////////////////////////////////////////
    @IBOutlet weak var myUIScrollView: UIScrollView!
    var myUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(language == "english"){
            language = "english"
            self.Back.text = "Back"
            self.Yourfuture.text = "Your Development"
            self.RankDescription.text = "Jeunesse Ranking " + "\n" + "\n" + "1. Distributor" + "\n" + "->" + "\n" + "2. Registered Executive" + "\n" + "->" + "\n" + "3. Jade Executive" + "\n" + "->" + "\n" + "4. Pearl Executive" + "\n" + "->" + "\n" + "5. Sapphire Executive" + "\n" + "->" + "\n" + "6. Sapphire Elite" + "\n" + "->" + "\n" + "7. Ruby Executive" + "\n" + "->" + "\n" + "8. Emerald Executive" + "\n" + "->" + "\n" + "9. Diamond Executive"
            self.myUIScrollView.maximumZoomScale = 5.0
            self.myUIScrollView.minimumZoomScale = 0.0
            self.myUIScrollView.delegate = self
            
            let image: UIImage = UIImage(named: "generationyoung_slide.jpg")!
            
            myUIImageView = UIImageView(image: image)
            self.myUIScrollView.addSubview(myUIImageView)
            updateMinZoomScaleForSize(view.bounds.size)
            
        }
        else if(language == "traditional"){
            language = "traditional"
            self.Back.text = "回到前頁"
            self.Yourfuture.text = "你的前途"
            self.RankDescription.text = "婕斯階梯" + "\n" + "\n" + "1. 經銷商" + "\n" + "->" + "\n" + "2. 合格經銷商" + "\n" + "->" + "\n" + "3. 翡翠經銷商" + "\n" + "->" + "\n" + "4. 珍珠經銷商" + "\n" + "->" + "\n" + "5. 藍寶石經銷商" + "\n" + "->" + "\n" + "6. 星光藍寶經銷商" + "\n" + "->" + "\n" + "7. 紅寶經銷商" + "\n" + "->" + "\n" + "8. 綠寶經銷商" + "\n" + "->" + "\n" + "9. 鑽石經銷商" + "\n"
            self.myUIScrollView.maximumZoomScale = 5.0
            self.myUIScrollView.minimumZoomScale = 0.0
            self.myUIScrollView.delegate = self
            
            let image: UIImage = UIImage(named: "generationyoung_slide.jpg")!
            
            myUIImageView = UIImageView(image: image)
            self.myUIScrollView.addSubview(myUIImageView)
            updateMinZoomScaleForSize(view.bounds.size)
            
        }
        else if(language == "simplified"){
            language = "simplified"
            self.Back.text = "回到前页"
            self.Yourfuture.text = "你的前途"
            self.RankDescription.text = "婕斯阶梯" + "\n" + "\n" + "1. 经销商" + "\n" + "->" + "\n" + "2. 合格经销商" + "\n" + "->" + "\n" + "3. 翡翠经销商" + "\n" + "->" + "\n" + "4. 珍珠经销商" + "\n" + "->" + "\n" + "5. 蓝宝石经销商" + "\n" + "->" + "\n" + "6. 星光蓝宝经销商" + "\n" + "->" + "\n" + "7. 红宝经销商" + "\n" + "->" + "\n" + "8. 绿宝经销商" + "\n" + "->" + "\n" + "9. 钻石经销商" + "\n"
            
            self.myUIScrollView.maximumZoomScale = 5.0
            self.myUIScrollView.minimumZoomScale = 0.0
            self.myUIScrollView.delegate = self
            
            let image: UIImage = UIImage(named: "generationyoung_slide.jpg")!
            
            myUIImageView = UIImageView(image: image)
            self.myUIScrollView.addSubview(myUIImageView)
            updateMinZoomScaleForSize(view.bounds.size)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myUIImageView
        
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / myUIImageView.bounds.width
        let heightScale = size.height / myUIImageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        self.myUIScrollView.minimumZoomScale = minScale
        
        self.myUIScrollView.zoomScale = minScale
    }
}
