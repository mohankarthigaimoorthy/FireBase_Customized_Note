//
//  ViewController.swift
//  customizeNote
//
//  Created by Mohan K on 17/04/23.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct Note {
    var emailId: String
    var privacyEnabled: Bool
    var userId: String
    var userName: String
    var createdDate: Date
    var isArchieved: Bool
    var isDeleted: Bool
    var isPinned: Bool
    var lastEditedDate: Date
    var noteColor: String
    var noteDescription: String
    var noteTitle: String
    var noteType: Int
}

class ViewController: UIViewController {
   
    @IBOutlet weak var selctor: UISegmentedControl!
    @IBOutlet weak var differentiateLabel: UILabel!
    @IBOutlet weak var emailtxt : UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var signedButton: UIButton!
   
    var notes: [Note] = []
    var isSignIn: Bool = true
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//      let newLayer = CAGradientLayer()
//        newLayer.colors = [UIColor.blue.cgColor,UIColor.red.cgColor, UIColor.systemTeal.cgColor,UIColor.green.cgColor,UIColor.systemMint.cgColor,UIColor.blue.cgColor,]
//        newLayer.frame = view.frame
//        view.layer.addSublayer(newLayer)
    }

  
    @IBAction func changeSegment(_ sender: Any) {
        isSignIn = !isSignIn
        if isSignIn{
            differentiateLabel.text = "Sign In"
            signedButton.setTitle("Sign In", for: .normal)
        }
        else {
            differentiateLabel.text = "Register"
            signedButton.setTitle("Register", for: .normal)
        }
        
    }
    @IBAction func emailtextfield(_ sender: Any) {
    }
    @IBAction func passwordtxtfield(_ sender: Any) {
    }
    
    @IBAction func btnSign(_ sender: Any) {
        
        if let email = emailtxt.text , let pass = passwordtxt.text {
            
            if isSignIn {
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user {
               
                        self.performSegue(withIdentifier: "gotoHome", sender: self)
        
                    }
                    else {
                        
                    }
                })
                emailtxt.text = ""
                passwordtxt.text = ""
            }
            else
            {
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    
                    if let u = user {
                        var refreshAlert = UIAlertController(title: "Alert", message: "you have successfulley registered the account.", preferredStyle: UIAlertController.Style.alert)

                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                          print("Handle Ok logic here")
                          }))

                        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                          print("Handle Cancel Logic here")
                          }))

                        self.present(refreshAlert, animated: true, completion: nil)                    }
                    else {
                        
                    }
                })
            }
            emailtxt.text = ""
            passwordtxt.text = ""
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailtxt.resignFirstResponder()
        passwordtxt.resignFirstResponder()
    }
}

