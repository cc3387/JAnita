//
//  ViewController.swift
//  JeunessebyAnita
//
//  Created by Clement Chan on 10/4/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class News: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as UITableViewCell
        
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size: 20)
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping;
        
        if(indexPath.section == 0){
            cell.backgroundColor = UIColor(red: 240, green: 230, blue: 255)
        }
        else if(indexPath.section == 1){
            cell.backgroundColor = UIColor(red: 240, green: 230, blue: 255)
        }
        else if(indexPath.section == 2){
            //cell.backgroundColor = UIColor(red: 255, green: 102, blue: 102)
        }
        
        return cell;
    }
    
    
    //Variables
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    var sections: [Section] = SectionsData().getSectionsFromData()
    var messages = [String]()
    var times = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Setup delegates */
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200;
        tableView.delegate = self
        tableView.dataSource = self
        
        self.messages = [];
        self.times = [];
        
        
        self.textView.text = "選擇J.Anita改變生命的15個理由:" + "\n" + "\n" + "1、美麗、健康產業是未來的趨勢" + "\n" + "\n" + "2、全球經濟一體化，在婕斯我們可以開發全球客戶，物流全球點對點配送" + "\n" + "\n" + "3、在未來的消費模式必然是網購的時代，而婕斯的交互式網購模式與時代同行" + "\n" + "\n" + "4、婕斯的三大系統優勢：（1）細胞優化管理系統；（2）全球網購消費系統；（3）趨勢財富贏利系統；" + "\n" + "\n" + "5、讓自己成為消費商，花本來應該花的錢，賺本來賺不到的錢，這就是未來的趨勢。" + "\n" + "\n" + "6、婕斯是一個綜合性的國際商業平台，更是可以成就夢想的國際舞台。" + "\n" + "\n" + "7、在婕斯擁有頂尖醫學的科研博士團隊，產品品質絕對放心。" + "\n" + "\n" + "8、婕斯的成人幹細胞技術是領先全球5到10年的尖端技術，具有絕對競爭優勢。" + "\n" + "\n" + "9、未來的發展趨勢必然是抗衰老的領域，而婕斯擁有諾貝爾獎理論技術研發有效延緩老化的高端技術，又是未來發展的一大需求，前景十分廣闊。" + "\n" + "\n" + "10、亞健康狀態的人越來越多，而在婕斯醫學團隊的帶領下研發了一款精品：DNA基因修護早晚系列，可以給予我們身體細胞的所需要的養分，我們健康有保障。" + "\n" + "\n" + "11、市面上的護膚產品五花八門，價錢更是參差不齊價格不菲，卻沒有給到我們想要的效果，如果說有一個富含248種生長因子專利技術的產品可以解決所有的問題，讓我們擁有健康的肌膚還可以年輕漂亮的同時沒有任何副作用，相信我一定會嘗試，我不懂高科技但我相信。" + "\n" + "\n" + "12、婕斯頂尖的產品的效果顯著，誰用誰知道。" + "\n" + "\n" + "13、婕斯操作簡單，簡單的事情重複做，沒有任何壓力。" + "\n" + "\n" + "14、選擇比努力更重要。公司有實力。" + "\n" + "\n" + "15、婕斯創辦人Randy Ray和Wendy Lewis夫婦是具有大愛的使者，在全球各地都在做慈善活動，捐款興建學校，孤兒院等，幫助更多的貧困地區脫離貧苦生活。"
        
//        var ref = FIRDatabase.database().reference()
//        
//        ref.queryOrdered(byChild: "Email").queryEqual(toValue: "luianita@yahoo.com").observe(.childAdded, with: { snapshot in
//                if let source = snapshot.value as? [String:AnyObject] {
//                    let uid = source["uid"] as! String
//
//                    //Loading the message query
//                    ref.child(uid).child("Messages").queryLimited(toLast: 1000).observe(.childAdded, with:{ snapshot in
//                        if let sourceone = snapshot.value as? [String:AnyObject] {
//                      
//                            let message = sourceone["message"] as! String
//                            let time = sourceone["time"] as! String
//                            
//                            self.messages.append(message)
//                            self.times.append(time)
//                            
//                            var finaltext = "";
//                            
//                            for (ind,time) in zip(self.messages.reversed(),self.times.reversed()){
//                                finaltext += ind + "\n" + time + "\n" + "\n";
//                            }
//                            
//                            self.textView.text = finaltext
//                        }
//                    })
//                }
//        })

        self.textView.backgroundColor = UIColor(red: 227, green: 236, blue: 255)
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].heading
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    //Read the whole table with sections
    private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as UITableViewCell
        
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping;
        
        if(indexPath.section == 0){
            cell.backgroundColor = UIColor(red: 240, green: 230, blue: 255)
        }
        else if(indexPath.section == 1){
            cell.backgroundColor = UIColor(red: 240, green: 230, blue: 255)
        }
        else if(indexPath.section == 2){
            //cell.backgroundColor = UIColor(red: 255, green: 102, blue: 102)
        }
        
        return cell;
    }
    
    
    
};


//Class for sections
class SectionsData {
    
    func getSectionsFromData() -> [Section] {
        
        // you could replace the contents of this function with an HTTP GET, a database fetch request,
        // or anything you like, as long as you return an array of Sections this program will
        // function the same way.
        
        var sectionsArray = [Section]()
        
        if(language == "english"){
        let frontword = Section(title: "J.Anita" + " - Foreword", objects: ["J.Anita products allow you to stay young, focus and healthy. Learn more about J.Anita Product by adding luishiunam in Wechat!"])
        let news = Section(title: "J.Anita" + " -- Reasons", objects: [""])
        sectionsArray.append(frontword)
        sectionsArray.append(news)
        }
        else if(language == "traditional"){
        let frontword = Section(title: "J.Anita" + " - 前言", objects: ["立刻加入 J.Anita, 學習，交流，達至成功，請在 Wechat 加 luishiunam 為朋友並了解更多！"])
        let news = Section(title: "J.Anita" + " -- 原因", objects: [""])
        sectionsArray.append(frontword)
        sectionsArray.append(news)
        }
        else if(language == "simplified"){
        let frontword = Section(title: "J.Anita" + " - 前言", objects: ["立刻加入 J.Anita, 学习，交流，达致成功，请在 Wechat 加 luishiunam 为朋友并了解更多！"])
        let news = Section(title: "J.Anita" + " -- 原因", objects: [""])
        sectionsArray.append(frontword)
        sectionsArray.append(news)
        }
        
        return sectionsArray
    }
}


struct Section {
    
    var heading : String
    var items : [String]
    
    init(title: String, objects : [String]) {
        heading = title
        items = objects
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}


