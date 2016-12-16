//
//  ViewController.swift
//  JeunessebyAnita
//
//  Created by Clement Chan on 10/4/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Batch
import Firebase

class GetRich:UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var Opportunity: UILabel!
    @IBOutlet weak var Back: UILabel!
    
    //////////////////////////////////////
    @IBOutlet weak var GetRichTextView: UITextView!
    @IBOutlet weak var myScrollView: UIScrollView!
    var myUIImageView: UIImageView!
    var ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        
        if(language == "english"){
            language = "english"
            self.Back.text = "Back"
            self.Opportunity.text = "Opportunity"
            self.GetRichTextView.text! = "1+4 Formula of Success : " + "\n" + "\n" + "1. Join Us：" + "\n" + "https://joffice.jeunesseglobal.com/signup.asp?locale=zh-US&siteurl=simplyeffective" + "\n" + "\n" + "2. Experience Jeunesse products, learn the system and build up your team through Jeunesse University, Jeunesse annual EXPO" + "\n" + "https://simplyeffective.jeunesseglobal.com/zh-US/calendar"
        }
        else if(language == "traditional"){
            language = "traditional"
            self.Back.text = "回到前頁"
            self.Opportunity.text = "當今趨勢"
            self.GetRichTextView.text! = "1+4 成功方程式: " + "\n" + "1. 加入我們：" + "\n" + "https://joffice.jeunesseglobal.com/signup.asp?locale=zh-US&siteurl=simplyeffective" + "\n" + "2. 全面體驗產品，跟貼系統帶夥伴參加四個重要訓練： 艾莫總裁訓練班 婕斯大學 創業新典範年會" + "\n" + "https://simplyeffective.jeunesseglobal.com/zh-US/calendar"
        }
        else if(language == "simplified"){
            language = "simplified"
            self.Back.text = "回到前页"
            self.Opportunity.text = "当今趋势"
            self.GetRichTextView.text! = "1+4 成功方程式: " + "\n" + "1. 加入我们：" + "\n" + "https://joffice.jeunesseglobal.com/signup.asp?locale=zh-US&siteurl=simplyeffective" + "\n" + "2. 全面体验产品，跟贴系统带伙伴参加四个重要训练：艾莫总裁训练班 婕斯大学 创业新典范年会" + "\n" + "https://simplyeffective.jeunesseglobal.com/zh-US/calendar"
        }

        
        ////////////////////////////////////////////////////////////////////
        self.myScrollView.maximumZoomScale = 5.0
        self.myScrollView.minimumZoomScale = 0.0
        self.myScrollView.delegate = self
        
        let image: UIImage = UIImage(named: "generationyoung_slide.jpg")!
        
        myUIImageView = UIImageView(image: image)
        self.myScrollView.addSubview(myUIImageView)
        updateMinZoomScaleForSize(view.bounds.size)
        
        if(ProfileLogin.loginemail == "" && ProfileLogin.password == "" && ProfileLogin.uid == "" && ProfileLogin.phoneid == ""){
            
//            ref.queryOrdered(byChild: "Email").queryEqual(toValue: "luianita@yahoo.com")
//                .observe(.childAdded, with: { snapshot in
//                    
//                    if let source = snapshot.value as? [String:AnyObject] {
//                        
//                        ProfileLogin.joinlink = source["Joinlink"] as! String
//                        ProfileLogin.shoplink = source["Shoplink"] as! String
//                        
//                    }
//                })
        }
        else{
            
//            ref.queryOrdered(byChild: "Email").queryEqual(toValue: ProfileLogin.loginemail)
//                .observe(.childAdded, with: { snapshot in
//                    
//                    if let source = snapshot.value as? [String:AnyObject] {
//                        
//                        ProfileLogin.joinlink = source["Joinlink"] as! String
//                        ProfileLogin.shoplink = source["Shoplink"] as! String
//                        
//                    }
//            })
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myUIImageView
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / myUIImageView.bounds.width
        let heightScale = size.height / myUIImageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        self.myScrollView.minimumZoomScale = minScale
        
        self.myScrollView.zoomScale = minScale
    }
}
