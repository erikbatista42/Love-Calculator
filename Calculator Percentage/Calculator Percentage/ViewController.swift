import QuartzCore
import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    
    var percentage: String!
    var quote: String!
//MARK: Text Fields
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var secondNameTextField: UITextField!
//MARK: Override Func
    override func viewDidLoad() {

        percentage = ""
        
        let topColor = UIColor.magentaColor()
        
        let middeColor = UIColor.magentaColor()
        
        let bottomColor = UIColor.magentaColor()
        
        let gradientColors: [CGColor] = [topColor.CGColor, middeColor.CGColor, bottomColor.CGColor]
        
        let gradientLocations: [Float] = [0.0, 0.5, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstNameTextField.layer.cornerRadius = 20;
        
        secondNameTextField.layer.cornerRadius = 20;

        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calcButtonTapped(sender: AnyObject) {
        
//        let firstName = firstNameTextField.text
//        
//        let secondName = secondNameTextField.text
//        
//        let params = ["fname" : firstName!, "sname": secondName!]
//        callAPI(params)
        
        
      
    }
    
    func callAPI(params: [String:AnyObject]) {
        let apiToContact = "https://love-calculator.p.mashape.com/getPercentage"
        let headers = ["X-Mashape-Key": "ImFarXXjKSmshkeKhtAkoek0wzKip1ag9qZjsn6rBu4t9KNeyP" , "Accept":"application/json"]
        //let params = ["fname":"john" , "sname":"Alice"]
        print("about to run api fetch")
        Alamofire.request(.GET, apiToContact, parameters: params, headers: headers).responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.percentage = json["percentage"].stringValue
                    self.quote = json["result"].stringValue
                    print("RECIEVED DATA \(self.percentage)")
                    print(self.percentage)
                    print(self.quote)
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                    self.performSegueWithIdentifier("calculate", sender: nil)

                    
                }
                
                
            case .Failure(let error):
                print(error)
            }
            
        }
    }
    @IBAction func Calculate(sender: AnyObject) {
        let firstName = firstNameTextField.text
        
        let secondName = secondNameTextField.text
        
        let params = ["fname" : firstName!, "sname": secondName!]
        callAPI(params)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "calculate" {
            let destinationVC = segue.destinationViewController as! SecondViewController
            destinationVC.percentage = self.percentage
            destinationVC.quote = self.quote
        }
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
    }
    
}

