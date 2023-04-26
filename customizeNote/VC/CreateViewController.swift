//
//  CreateViewController.swift
//  customizeNote
//
//  Created by Mohan K on 18/04/23.
//

import UIKit

class CreateViewController: ViewController {

    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var noteText: UITextView!
 
    @IBOutlet weak var updatedBtn: UIButton!
   
    private let createVM = CreateViewModel()
    
//    var userInfo: UserMode!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        setupUI()
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//
//    }
//    private func setupUI(){
//        titleText.text = userInfo.noteTitle
//        noteText.text = userInfo.noteDescription
//    }
    
//    private func updateUserProfileDocument () {
//        let info = UserMode()
//        info.documentID = userInfo.documentID
//        info.noteTitle = titleText.text ?? ""
//        info.noteDescription = noteText.text ?? ""
//        
//        createVM.userInfo = info
//        createVM.updateUserProfileDocument{ (success, msg) in
//            if success {
//                self.alert(message: msg)
//                NotificationCenter.default.post(Notification.init(name: Notification.Name("UpdateData")))
//            } else {
//                self.alert(message: msg)
//            }
//        }
//    }
    private func createAuth() {
        createVM.noteTitle = titleText.text ?? ""
        createVM.noteDescription = noteText.text ?? ""
        
        createVM.storeCreateData{ (success, msg)
            in
            if success {
                self.alert(message: msg)
                
            }
            else {
                self.alert(message: msg)
            }
        }
    }
    @IBAction func saveButton(_ sender: Any) {
        
        
        createAuth()
    }
    
    
    @IBAction func titTextField(_ sender: Any) {
        
        
        
        
    }
  
    @IBAction func updateButton(_ sender: Any) {
//        updateUserProfileDocument () 
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
