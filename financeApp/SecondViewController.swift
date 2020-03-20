//
//  SecondViewController.swift
//  financeApp
//
//  Created by Van Quang Nguyen on 18/02/2020.
//  Copyright © 2020 Van Quang Nguyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var saveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var s = Formulae.Saving()
               
               var savingVal : Double = Formulae.calculateSavings(savingsDetail: s)
    }

    @IBAction func saveButton(_ sender: Any) {
        var amnt = Double((textField4.text! as NSString).floatValue)
        var rate = Double ((textField5.text! as NSString).floatValue)
        var year = Double ((textField6.text! as NSString).floatValue)
        var s = Formulae.Saving()
        s.interestRate = rate
        s.montlyPayment = amnt
        s.numOfYears = year
        var savVal : Double = Formulae.calculateSavings(savingsDetail: s)
        saveLabel.text = "\(savVal)"
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
