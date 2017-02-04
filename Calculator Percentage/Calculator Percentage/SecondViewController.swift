//
//  SecondViewController.swift
//  Calc Percent
//
//  Created by Erik Batista on 8/12/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    var percentage: String!
    var quote = String()
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
//    var percentage = String() {
//        didSet {
//            percentageLabel.text = percentage
//            print(percentage)
//            
//        }
//    }
//    var quote = String(){
//        didSet{
//            quoteLabel.text = quote
//        }
//    }
    
    override func viewDidLoad() {
        
        let topColor = UIColor.purpleColor()
        
        let middeColor = UIColor.magentaColor()
        
        let bottomColor = UIColor.purpleColor()
        
        let gradientColors: [CGColor] = [topColor.CGColor, middeColor.CGColor, bottomColor.CGColor]
        
        let gradientLocations: [Float] = [0.0, 0.5, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        percentageLabel.text = self.percentage ?? ""
        print(self.percentage)
        quoteLabel.text = self.quote
        print(self.quote)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func emailButton(sender: AnyObject) {
        let email = "erikbatista42@gmail.com"
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.sharedApplication().openURL(url!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
