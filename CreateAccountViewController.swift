//
//  CreateAccountViewController.swift
//  Test2
//
//  Created by Manoj Sarathy on 2/3/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let pw1 = passwordTextField.text else { return }
        var uid1:AuthDataResult?
        Auth.auth().createUser(withEmail: email, password: pw1) { firebaseResult, error in
            if let e = error {
                print(email)
            } else {
                // Go to home screen
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
        //code to upload data
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let user = Auth.auth().currentUser
        let uid = user!.uid
        //ref.child("users/\(uid)/\(friendId)").setValue(true)
        //ref.child("users").child(uid).setValue([uid: true])
        ref.child("users/\(uid)/\(uid)").setValue(true)
        
        //ref.child("users").child(uid).child("data").setValue(["email": email])
        ref.child("users/\(uid)/data/email").setValue(email)
        /*
        ref.child("users").child(uid).child("data").setValue(["fname": ""])
        ref.child("users").child(uid).child("data").setValue(["phone": ""])
        ref.child("users").child(uid).child("data").setValue(["email": ""])
        ref.child("users").child(uid).child("data").setValue(["lname": ""])
        ref.child("users").child(uid).child("data").setValue(["company": ""])
        ref.child("users").child(uid).child("data").setValue(["title": ""])
         */
         
        
        
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
