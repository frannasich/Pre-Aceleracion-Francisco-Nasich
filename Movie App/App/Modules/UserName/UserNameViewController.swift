//
//  UserNameViewController.swift
//  Movie App
//
//  Created by Fran Nasich on 01/03/2022.
//

import UIKit

class UserNameViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func startMoviesApp(_ sender: Any) {
        textField.keyboardType = .emailAddress
        if let userName = textField.text, !userName.isEmpty, isValidEmail(string: userName) {
            let moviesListViewController = MoviesListViewController()
            self.navigationController?.pushViewController(moviesListViewController, animated: true)
        } else {
                presentNoUserNameAlert()
        }
    }
    
    
    private func presentNoUserNameAlert(){
        let alert = UIAlertController(title: "Alerta!", message: "Por favor ingrese un correo váñido primero", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func isValidEmail(string: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }

}
