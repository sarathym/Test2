//
//  LoginViewController.swift
//  Test2
//
//  Created by Manoj Sarathy on 2/3/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let pw1 = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pw1) { firebaseResult, error in
            if let e = error {
                print("error")
            } else {
                // Go to home screen
                self.performSegue(withIdentifier: "goToNext", sender: self)
                
            }
        }
        
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
