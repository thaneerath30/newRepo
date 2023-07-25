//
//  RegistrationViewModel.swift
//  TechArtGrop
//
//  Created by THANEERATH T H on 25/07/23.
//

import Foundation
import CoreData
import UIKit
protocol RegistrationViewDelegate {
    func registerUser(from firstName:String?,lastName : String?,email:String?,mobileNumber:String?,userName:String?,password:String?,confirmPassword:String?)
}
class RegistrationViewModel : RegistrationViewDelegate{
    
    
    var delegate:RegistrationControllerDelegate?
    
    func registerUser(from firstName: String?, lastName: String?, email: String?, mobileNumber: String?, userName: String?, password: String?, confirmPassword: String?) {
        guard let firstName = firstName else { delegate?.showAert(errormess: "Enter Value for First Name")
            return
        }
        guard let lastName = lastName else {
            delegate?.showAert(errormess: "Enter Value for Second Name")
            return
        }
        guard let emailField = email else {
            delegate?.showAert(errormess: "Enter Value for Email")
            return
        }
        guard let mobileNm = mobileNumber else {
            delegate?.showAert(errormess: "Enter Value for MobileNumber")
            return
        }
        guard let userName = userName else {
            delegate?.showAert(errormess: "Enter Value for UserName")
            return
        }
        guard let passwordField = password else {
            delegate?.showAert(errormess: "Enter Value for Password")
            return
        }
        guard let confirmPass = confirmPassword else {
            delegate?.showAert(errormess: "Enter Value for Confirm Password")
            return
        }
 
        if validation(firstName: firstName, lastName: lastName, emailField: emailField, mobileNm: mobileNm, userName: userName, passwordField: passwordField, confirmPass: confirmPass){
            saveData(firstName: firstName, lastName: lastName, emailField: emailField, mobileNm: mobileNm, userName: userName, passwordField: passwordField, confirmPass: passwordField)
        }
    }
    
    func validation(firstName:String,lastName:String,emailField : String,mobileNm : String,userName:String,passwordField:String,confirmPass:String) -> Bool {
        if firstName.count > 0{
            if lastName.count > 0 {
                if emailField.count > 0 {
                    if mobileNm.count > 0 {
                        if userName.count > 0 {
                            if passwordField.count > 0 {
                                if confirmPass.count > 0{
                                    if emailField.isEmail{
                                        if mobileNm.isPhoneNumber{
                                            if passwordField.count >= 6{
                                                if passwordField == confirmPass{
                                                    return true
                                                }
                                                else{
                                                    delegate?.showAert(errormess: "password and confirmPassword field should be same")
                                                }
                                            }
                                            else{
                                                delegate?.showAert(errormess: "minimum 6 characters is needed for password")
                                            }
                                        }
                                        else{
                                            delegate?.showAert(errormess: "Enter valid mobile number")
                                        }
                                        
                                    }
                                    else{
                                        delegate?.showAert(errormess: "Enter valid email")
                                    }
                                }
                                else{
                                    delegate?.showAert(errormess: "Enter Value for Confirm Password")
                                }
                            }
                            else{
                                    delegate?.showAert(errormess: "Enter Value for Password")
                                
                            }
                        }
                        else{
                            delegate?.showAert(errormess: "Enter Value for user name")
                        }
                    }
                    else{
                        delegate?.showAert(errormess: "Enter Value for mobile number")
                    }
                }
                else{
                    delegate?.showAert(errormess: "Enter Value for email")
                }
            }
            else{
                delegate?.showAert(errormess: "Enter Value for last name")
            }
        }
        else{
            delegate?.showAert(errormess: "Enter Value for first name")
        }
        return false
    }
    func saveData(firstName:String,lastName:String,emailField : String,mobileNm : String,userName:String,passwordField:String,confirmPass:String)  {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "UserDetails", in: context) else { return  }
        let newUser = NSManagedObject(entity: entity, insertInto: context)
        newUser.setValue(firstName, forKey: "firstName")
        newUser.setValue(lastName, forKey: "lastName")
        newUser.setValue(emailField, forKey: "email")
        newUser.setValue(mobileNm, forKey: "mobileNumber")
        newUser.setValue(userName, forKey: "userName")
        newUser.setValue(passwordField, forKey: "password")
        do{
            try context.save()
            delegate?.getInfo(message: "Successfully Registered")
        }
        catch{
            delegate?.showAert(errormess: "Something went wrong")
        }
    }
    
}
