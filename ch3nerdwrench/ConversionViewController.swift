//
//  ConversionViewController.swift
//  ch3nerdwrench
//
//  Created by Raza on 04/03/2016.
//  Copyright © 2016 Arsalan. All rights reserved.
//

import Foundation


import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate{
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        NSLog("colour changed to black after 12 noon")
      let curntime = timecomparision()
        if curntime >= 12 {
        view.backgroundColor = UIColor.blackColor()        }
        
    }
    
    
    func timecomparision()->Int{
    
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: date)
        let hour = components.hour
        return hour
    
    }
    
    var farenheit: Double?{
        didSet{
            updatecelcius()
            
        }
        
        
    }
    
    
    var celcius : Double?{
        if let value = farenheit{
            return (value - 32)*(5/9)
        }
        else {
            return nil
        }
        
        
    }
    
    
    
    @IBOutlet weak var farenheitLabel: UITextField!
    
    @IBOutlet weak var convertedlabelcelsius: UILabel!
    
    @IBAction func dismiskeyboard(sender: AnyObject) {
        
        farenheitLabel.resignFirstResponder()
        
    }
    
    
    @IBAction func conversion(sender: UITextField) {
        
        if  let text = farenheitLabel.text , value = Double(text)  {
            farenheit = value
            
            
            
        }
        else{
            
            convertedlabelcelsius.text = "???"
            
            
        }
        
    }
    
    
    
    func updatecelcius(){
        if let cValue = celcius{
            convertedlabelcelsius.text = numberFormater.stringFromNumber(cValue)
            
        }else {
            
            convertedlabelcelsius.text = "???"
            
            
        }
        
        
        
    }
    
    
    
    let numberFormater : NSNumberFormatter = {
        
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
        
        
    }()
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        
    
        
        
        
        
        if (range.length == 1 && string.isEmpty){
            print("Used Backspace")
            return true
        }
        
        
        let disabledCharacters:NSCharacterSet = NSCharacterSet(charactersInString: "1234567890.,")
        let disstring = String(disabledCharacters)
        let x = disstring.characters.count
        for (var i:Int = 0; i < x; ++i) {
            let c = (string as NSString).characterAtIndex(i)
            if !(disabledCharacters.characterIsMember(c))  {
                print("Can't use that character dude :/")
                return false
            }else{
            
            let existinghtext = farenheitLabel.text?.rangeOfString(".")
            let replacementtext = string.rangeOfString(".")
                let comma1 = farenheitLabel.text?.rangeOfString(",")
                let comma2 = string.rangeOfString(",")
            //        print("current text : \(existinghtext)")
            //        print("replacement text : \(replacementtext)")
            
            
            if (existinghtext != nil && replacementtext != nil) {
                
                
                return false
                
                
            }
            else if (comma1 != nil && comma2 != nil){
                
                return false
            
            }else if(existinghtext != nil && comma2 != nil){
            return false
                
            
            }else{
                return true
                }
       
        
                
        
        }
       
        
        
    }
    return true
}

    
    
    
    
    
    }

    