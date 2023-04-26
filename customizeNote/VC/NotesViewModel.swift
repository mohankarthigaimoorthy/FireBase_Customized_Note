//
//  NotesViewModel.swift
//  customizeNote
//
//  Created by Mohan K on 18/04/23.
//

import Foundation

class NotesViewModel : BaseViewModel {
 
    var arrUsers = [UserMode]()
    
    func getUsersCollection(completionHanheler: @escaping ((_ success: Bool,_ message: String)-> ())) {
        db.collection(FirestoreTableInfo.pepul).getDocuments() {
            (querySnapshot, err)in
            if let err = err {
                print("Error getting documents: \(err)")
                completionHanheler(false, err.localizedDescription)
            }
            else {
                guard let usersJson = querySnapshot?.documents else {
                    return
                }
                self.arrUsers.removeAll()
                for user in usersJson {
                    let user = UserMode(json: user.data(), documentID: user.documentID)
                    self.arrUsers.append(user)
                }
                completionHanheler(true, "get users successfully")
            }
        }
    }
}
