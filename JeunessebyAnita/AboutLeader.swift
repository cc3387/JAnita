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

class AboutLeader:UIViewController{
    
    @IBOutlet weak var Back: UILabel!
    @IBOutlet weak var Leadership: UILabel!
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    var ref = FIRDatabase.database().reference()
    @IBOutlet weak var AboutLeader: UITextView!
    
    override func viewDidLoad() {
        
        if(language == "english"){
            language = "english"
            self.Back.text = "Back"
            self.Leadership.text = "About " + Name
        }
        else if(language == "traditional"){
            language = "traditional"
            self.Back.text = "回到前頁"
            self.Leadership.text = "有關 " + Name
        }
        else if(language == "simplified"){
            language = "simplified"
            self.Back.text = "回到前页"
            self.Leadership.text = "有关 " + Name
        }
        
        self.AboutLeader.text = ""
        
        if(Referred.referralemail == "luianita@yahoo.com"){
          self.AboutLeader.text = "Anita 在从事25年专业会计师后，本打算享受优悠退休生活，但偶然机会洞悉婕斯是一盘无限延伸，踏实经营的生意，被公司的文化，产品，制度，参与者的质素和系统方法所吸引，重燃自己的梦想。决定推迟退休计划，重新投入而且不断学习，配合严谨的专业精神，表现出色。计划尽快达到财富，时间和心灵自主，成功找到自己的理想人生" + "\n" + "\n" + "WeChat ID: " + "luishiunam"
        }
        else if (Referred.referralemail != "luianita@yahoo.com"){
            
          var ref = FIRDatabase.database().reference()
            
          ref.queryOrdered(byChild: "Email").queryEqual(toValue: Referred.referralemail).observe(.childAdded, with: { snapshot in
                if let source = snapshot.value as? [String:AnyObject] {
                self.AboutLeader.text = source["AboutLeader"] as! String!
                }
          })
            
        }
    }
    
};
