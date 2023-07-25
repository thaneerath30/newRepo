//
//  ViewController.swift
//  TechArtGrop
//
//  Created by THANEERATH T H on 25/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func showAlertWithSingleFunctionality(message: String, title : String, buttonTitle : String, fucntion:@escaping () -> Void){
        
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.black
       
        
        let tryAction = UIAlertAction(title: buttonTitle, style: .default, handler: {
            
            (alert: UIAlertAction!) in
            
            fucntion()
            
            
        })
        alertController.addAction(tryAction)
        self.present(alertController, animated: true, completion: nil)
    }
   
    func showAlertWithTwoFunctionality(message: String, title : String,view: UIViewController, buttonOneTitle : String, fucntionOne:@escaping () -> Void, buttonTwoTitle : String, fucntionTwo:@escaping () -> Void) {
        
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: buttonOneTitle, style: .cancel, handler: {
                
                (alert: UIAlertAction!) in
                
                fucntionOne()
                
                
            })
            
            
            
            let tryAction = UIAlertAction(title: buttonTwoTitle, style: .default, handler: {
                
                (alert: UIAlertAction!) in
                
                fucntionTwo()
                
                
            })
            
            
            
           // alertController.view.tintColor = themeColor
            alertController.addAction(cancelAction)
            alertController.addAction(tryAction)
            view.present(alertController, animated: true, completion: nil)
            
            
        }
        
    }
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
   
}

