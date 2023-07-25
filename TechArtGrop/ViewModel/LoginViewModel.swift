//
//  LoginViewModel.swift
//  TechArtGrop
//
//  Created by THANEERATH T H on 25/07/23.
//

import Foundation
import CoreData
import UIKit
protocol LoginViewModelDelegate {
    func sendData(from userName:String?,password:String?)
}
class LoginViewModel : LoginViewModelDelegate{
    
    var delegate:LoginViewControllerDelegate?
    
    func sendData(from userName:String?,password:String?)  {
        guard let userNameField = userName else {
            return
        }
        guard let passwordField = password else {
            return
        }
        
        if validation(userName: userNameField, password: passwordField){
            checkUserDetails(userName: userNameField, password: passwordField)
        }
    }
    
    func validation(userName:String,password:String) -> Bool {
        if userName.count > 0{
            if password.count > 0 {
                return true
            }
            else{
                delegate?.showAert(errormess: "enter password")
            }
        }
        else{
            delegate?.showAert(errormess: "enter userName")
        }
        return false
    }
    
    func checkUserDetails(userName:String,password:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetails")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "userName == %@", userName)
        do{
            let result = try context.fetch(request)
            if result.count <= 0 {
                delegate?.showAert(errormess: "This user is not registered!!please signup to continue")
            }
            else{
                for data in result as! [UserDetails]{
                    if password == data.password{
                        delegate?.getInfo(message: "Logined sucessfully")
                    }
                    else{
                        delegate?.showAert(errormess: "Please enter correct password")
                    }
                }
            }
        }
        catch{
            delegate?.showAert(errormess: "This user is not registered!!please signup to continue")
        }
    }
}
