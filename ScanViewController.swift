//
//  ScanViewController.swift
//  Test2
//
//  Created by Manoj Sarathy on 2/3/23.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseCore
import FirebaseAuth
import EFQRCode

class ScanViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {


    @IBOutlet weak var codeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        /*
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        if let testImage = UIImage(named: "test.png")?.cgImage {
            let codes = EFQRCode.recognize(testImage)
            if !codes.isEmpty {
                print("There are \(codes.count) codes")
                for (index, code) in codes.enumerated() {
                    print("The content of QR Code \(index) is \(code).")
                }
            } else {
                print("There is no QR Codes in testImage.")
            }
        }
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let user = Auth.auth().currentUser
        let uid = user!.uid
        ref.child("users").child(uid).setValue(["user-id": true])
        */
    }
    
    @IBAction func submitClicked(_ sender: UIButton) {
        guard let friendId = codeTextField.text else { return }
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let user = Auth.auth().currentUser
        let uid = user!.uid
        ref.child("users").child(friendId).observeSingleEvent(of: .value) { (snapshot) in
            print("Exists: \(snapshot.exists())")
            ref.child("users/\(uid)/\(friendId)").setValue(true)
            ref.child("users/\(friendId)/\(uid)").setValue(true)
        }
        
        //slet uidExists = Auth.auth()
        
        print(friendId)
        
        let dialogMessage = UIAlertController(title: "Attention", message: "If code is valid, friend has been added!", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
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
