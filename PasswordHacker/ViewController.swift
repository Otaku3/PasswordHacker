//
//  ViewController.swift
//  PasswordHacker
//
//  Created by 大林拓実 on 2018/06/04.
//  Copyright © 2018年 TakumiObayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel1: UILabel!    //右から1
    @IBOutlet var resultLabel2: UILabel!    //右から2
    @IBOutlet var resultLabel3: UILabel!    //右から3
    @IBOutlet var resultLabel4: UILabel!    //右から4
    
    @IBOutlet var countLabel: UILabel!
    
    var password: Int = 8000

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(){
        for i in 0...9999{
            //解析中の数字を表示
            countLabel.text = String(i)
            //処理を待機（UX的に）
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
            
            if password == i {
                //passwordの桁ごとの数字を入れる配列
                var digits = [Int]()
                
                for _ in 0...3{
                    digits.append(password%10)
                    password = password / 10
                }
                resultLabel1.text = String(digits[0])
                resultLabel2.text = String(digits[1])
                resultLabel3.text = String(digits[2])
                resultLabel4.text = String(digits[3])
                
                print("正解は\(i)です！")
                countLabel.text = "正解は\(i)です！"
                break
            }
        }
    }
    
    @IBAction func reset(){
        password = 0084
        countLabel.text = "「START」ボタンを押して解析開始"
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
    }


}

