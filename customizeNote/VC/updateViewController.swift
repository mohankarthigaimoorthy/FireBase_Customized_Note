//
//  updateViewController.swift
//  customizeNote
//
//  Created by Mohan K on 19/04/23.
//

import UIKit

class updateViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextView!
    @IBOutlet weak var updateText: UIButton!
    
    var userInfo: UserMode!
private let updateVM = UpdateViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        text1.text = userInfo.noteTitle
        text2.text = userInfo.noteDescription
    }

    private func updateUserProfileDocument () {
        let info = UserMode()
        info.documentID = userInfo.documentID
        info.noteTitle = text1.text ?? ""
        info.noteDescription = text2.text ?? ""
        
        updateVM.userInfo = info
        updateVM.updateUserProfileDocument{ (success, msg) in
            if success {
                self.alert(message: msg)
                NotificationCenter.default.post(Notification.init(name: Notification.Name("UpdateData")))
            } else {
                self.alert(message: msg)
            }
        }
    }
    @IBAction func updatedBtn(_ sender: Any) {
        updateUserProfileDocument ()

        
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
