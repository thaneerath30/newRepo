//
//  LoginViewController.swift
//  TechArtGrop
//
//  Created by THANEERATH T H on 25/07/23.
//

import UIKit

protocol LoginViewControllerDelegate {
    func getInfo(message:String?)
    func showAert(errormess:String)
}

class LoginViewController: ViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.delegate = self
    }
    @IBAction func signupButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        viewModel.sendData(from: userNameTextField.text, password: passwordTextField.text)
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

extension LoginViewController:LoginViewControllerDelegate{
    func getInfo(message: String?) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let desvc = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(desvc, animated: true)
    }
    
    func showAert(errormess: String) {
        showAlertWithSingleFunctionality(message: errormess ?? "Failure", title: "Login", buttonTitle: "OK", fucntion: {
            self.dismiss(animated: true)})
    }
    
    
    
    
    
    
}
