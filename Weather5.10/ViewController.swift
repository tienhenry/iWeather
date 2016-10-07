//
//  ViewController.swift
//  Weather5.10
//
//  Created by admin on 10/5/16.
//  Copyright © 2016 tien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var cityLabel: UILabel!
    
    @IBOutlet var CLabel: UILabel!
    
    @IBOutlet var quoteLabel: UILabel!
    
    @IBOutlet var tempLabel: UIButton!
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    var quotes = ["Chúng ta có thể phàn nàn vì trong bụi hoa hồng có gai, hoặc hãy vui mừng vì trong bụi gai có hoa hồng -Abraham Lincoln-", "Nếu bạn không bắt tay vào làm thì không có điều gì là khả thi cả -Jack Ma-", "Hãy cứ khát khao, hãy cứ dại khờ -Steve Job-", "Cuộc sống vốn không công bằng, hãy tập quen dần với điều đó -Bill Gates-", "Không có gì quý hơn độc lập & tự do -Hồ Chí Minh-", "Hãy sống như hôm nay là ngày cuối của cuộc đời -Henry Ford-"]
    
    var city = ["Hà Nội", "T.P Hồ Chí Minh", "Đà Nẵng", "Cần Thơ", "Hải Phòng", "Huế", "Nha Trang", "Điện Biên Phủ"]
    
    var backgroundImage = ["Blood", "Moon", "Sun"]
    
    @IBAction func actionChangeTemp(sender: AnyObject) {
        
        cToF()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func randomButton(sender: AnyObject) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        
        cityLabel.text = city[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        
        quoteLabel.text = quotes[quoteIndex]
        
        let imageIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        
        backgroundImageView.image = UIImage.init(named: backgroundImage[imageIndex])
        
        getTemp()
        
    }
    
    func getTemp() -> Void {
        
        let randomNumber = String(format: "%2.1f", tempRandom())
        
        // tempLabel.titleLabel?.text = randomNumber
        
        tempLabel.setTitle(randomNumber, forState: .Normal)
        
        
    }
    
    func tempRandom() -> Double {
        
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        
                    }

    func cToF()  {
        
            if CLabel.text == "C" {
            
// tempLabel.titleLabel?.text = String(Double((tempLabel.titleLabel?.text!)!)! * 1.8 + 32)
            
            tempLabel.setTitle(String(format:"%2.1f", (Double((tempLabel.titleLabel?.text!)!)! * 1.8 + 32)), forState: .Normal)
            
            CLabel.text = "F"
            
                } else {
            
                    if CLabel.text == "F" {
                
// tempLabel.titleLabel?.text = String((Double((tempLabel.titleLabel?.text!)!)! - 32) / 1.8)
                
                        tempLabel.setTitle(String(format:"%2.1f", ((Double((tempLabel.titleLabel?.text!)!)! - 32) / 1.8)), forState: .Normal)
                
                        CLabel.text = "C"
                
                }
            }
        
        }
    
    }

