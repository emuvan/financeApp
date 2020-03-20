//
//  FirstViewController.swift
//  financeApp
//
//  Created by Van Quang Nguyen on 18/02/2020.
//  Copyright © 2020 Van Quang Nguyen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var calLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func MortgageCal(_ sender: Any) {
        var amnt = Double((textField1.text! as NSString).floatValue)
            var rate = Double((textField2.text! as NSString).floatValue)
            var year = Double((textField3.text! as NSString).floatValue)
            
            var m = Formulae.Mortgage()
        m.loanAmount = amnt
        m.interestRate = rate
        m.numOfYears = year
            var mortgageVal : Double = Formulae.calculateMortgage(mortgageDetail: m)
        
        calLabel.text = "\(mortgageVal)"
        }
   
        var keyBoardHeight:CGFloat = 0.0
         //MARK: - keyboard handling code
         override func viewWillAppear(_ animated: Bool) {
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
        name: .UIKeyboardWillShow, object: nil)
       
         }

         @objc func keyboardWillShow(notification: NSNotification) {

         //this moves the tab bar above the keyboard for all devices

         if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as?
        NSValue)?.cgRectValue {
         self.keyBoardHeight = keyboardSize.origin.y - keyboardSize.height -
        (self.tabBarController?.tabBar.frame.height)!
         }
         // tabBarMoved = true
         var tabBarFrame: CGRect = (self.tabBarController?.tabBar.frame)!
         tabBarFrame.origin.y = self.keyBoardHeight
         UIView.animate(withDuration: 0.25, animations: {() -> Void in
         self.tabBarController?.tabBar.frame = tabBarFrame
         })
    
    }
}

