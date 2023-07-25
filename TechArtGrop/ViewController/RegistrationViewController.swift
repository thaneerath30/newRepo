//
//  RegistrationViewController.swift
//  TechArtGrop
//
//  Created by THANEERATH T H on 25/07/23.
//

import UIKit
protocol RegistrationControllerDelegate {
    func getInfo(message:String?)
    func showAert(errormess:String)
}

class RegistrationViewController: ViewController {

    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mobilenumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    let viewModel = RegistrationViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.delegate = self
    }
    @IBAction func navigateToLoginScreen(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let desVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
    @IBAction func resgisterButtonAction(_ sender: Any) {
        viewModel.registerUser(from: firstNameTextField.text, lastName: lastNameTextField.text, email: emailTextField.text, mobileNumber: mobilenumberTextField.text, userName: userNameTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension RegistrationViewController:RegistrationControllerDelegate{
    func getInfo(message: String?) {
        self.showAlertWithSingleFunctionality(message: message ?? "success", title: "Registration", buttonTitle: "OK", fucntion: {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let desVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(desVC, animated: true)
        })
    }
    
    func showAert(errormess: String) {
        self.showAlertWithSingleFunctionality(message: errormess, title: "Registration Error", buttonTitle: "OK", fucntion: {
            self.dismiss(animated: true)
        })
    }
    
    
    
    
}
