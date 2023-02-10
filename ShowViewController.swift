//
//  ShowViewController.swift
//  Test2
//
//  Created by Manoj Sarathy on 2/3/23.
//

import UIKit
import Firebase
import EFQRCode

class ShowViewController: UIViewController {
    
    var uid = ""

    @IBOutlet weak var imageController: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var handle = Auth.auth().addStateDidChangeListener { auth, user in
            let user = Auth.auth().currentUser
            if let user = user {
              // The user's ID, unique to the Firebase project.
              // Do NOT use this value to authenticate with your backend server,
              // if you have one. Use getTokenWithCompletion:completion: instead.
              self.setUid(uid: user.uid)
              let email = user.email
              let photoURL = user.photoURL
                
            }
        }
    
        // Do any additional setup after loading the view.
    }
    
    func setUid(uid: String) {
        
        self.uid = uid
        let image = EFQRCode.generate(
            for: self.uid,
            watermark: UIImage(named: "WWF")?.cgImage
        )
        var uiimage = UIImage(cgImage: image.unsafelyUnwrapped)
        imageController.image = uiimage
        
        /*
        let qrcode1 = QRCode(string: self.uid)
        let myImage: UIImage? = try? qrcode1!.image()
        imageController.image = myImage
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
