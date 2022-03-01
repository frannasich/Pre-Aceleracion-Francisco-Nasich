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
        if let userName = textField.text, !userName.isEmpty {
            let moviesListViewController = MoviesListViewController()
            self.navigationController?.pushViewController(moviesListViewController, animated: true)
        } else {
                presentNoUserNameAlert()
        }
    }
    
    
    private func presentNoUserNameAlert(){
        let alert = UIAlertController(title: "Alerta!", message: "Por favor ingrese un nombre de usuario primero", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
