//
//  ConversionViewController.swift
//  ch3nerdwrench
//
//  Created by Raza on 04/03/2016.
//  Copyright © 2016 Arsalan. All rights reserved.
//

import Foundation


import UIKit

class ConversionViewController : UIViewController {
    
    
    
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}