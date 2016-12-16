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

class JoinUs:UIViewController{
    
    
    var ref = FIRDatabase.database().reference()
    
    @IBOutlet weak var Back: UILabel!
    @IBOutlet weak var Joinustitle: UILabel!
    @IBOutlet weak var JoinUsWords: UITextView!
    
    override func viewDidLoad() {
    
        if(language == "english"){
            language = "english"
            self.Back.text = "Back"
            self.Joinustitle.text = "Join Us"
        }
        else if(language == "traditional"){
            language = "traditional"
            self.Back.text = "回到前頁"
            self.Joinustitle.text = "加入我們"
        }
        else if(language == "simplified"){
            language = "simplified"
            self.Back.text = "回到前页"
            self.Joinustitle.text = "加入我们"
        }
        
   ///////////////////////////////////////////////////////////////////////////////////////////
        
        self.JoinUsWords.text = ""
        
        if(ProfileLogin.loginemail == "" && ProfileLogin.password == "" && ProfileLogin.uid == "" && ProfileLogin.phoneid == ""){
            
        }
        else{
            
            ref.queryOrdered(byChild: "Email").queryEqual(toValue: ProfileLogin.loginemail)
                .observe(.childAdded, with: { snapshot in
                    if let source = snapshot.value as? [String:AnyObject] {
                        let Joinus = source["Joinus"] as! String
                        print(Joinus)
                        self.JoinUsWords.text = Joinus
                    }
            })
            
        }
    }
};
