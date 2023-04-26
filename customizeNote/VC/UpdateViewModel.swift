//
//  UpdateViewModel.swift
//  customizeNote
//
//  Created by Mohan K on 19/04/23.
//

import Foundation

class UpdateViewModel: BaseViewModel {
  
    var userInfo: UserMode!

    func updateUserProfileDocument(completionHandler:  @escaping ((_ success: Bool, _ message: String)->())) {
        let docref = db.collection(FirestoreTableInfo.pepul).document(userInfo.documentID)
        
        docref.updateData([
            "emialId": userInfo.emailId,
            "privacyEnabled": userInfo.privacyEnabled,
            "userId": userInfo.userId,
            "userName": userInfo.userName,
            "createdDate": userInfo.createdDate,
            "isArchieved": userInfo.isArchieved,
            "isDeleted": userInfo.isDeleted,
            "isPinned": userInfo.isPinned,
            "lastEditDate": userInfo.lastEditedDate,
            "noteColor": userInfo.noteColor,
            "noteDescription": userInfo.noteDescription,
            "noteTitle": userInfo.noteTitle,
            "noteeType": userInfo.noteType
        ])
        { err in
            if let err = err {
                completionHandler(false, err.localizedDescription)
                DLog("Error updating document: \(err)")
            } else {
                completionHandler(true, "Document successfully updated")
                DLog("Document successfully updated")
            }
        }
    }
}
