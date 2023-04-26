//
//  CreateViewModel.swift
//  customizeNote
//
//  Created by Mohan K on 18/04/23.
//

import Foundation
import Firebase

class CreateViewModel: BaseViewModel{
    
//    var userInfo: UserMode!
    var noteDescription = ""
    var noteTitle = ""
//    var email: String = ""
//    var password: String = ""
    func createAuth(completionHandeler: @escaping ((_ success: Bool, _ message: String)->()) ) {
//
//        Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
//            if let error = error as NSError? {
//                switch AuthErrorCode.Code(rawValue: error.code) {
//                case .operationNotAllowed:
//                    completionHandeler(false, "operationNotAllowed")
//                    DLog("operationNotAllowed")
//                    break
//                case .emailAlreadyInUse:
//                    completionHandeler(false, "emailAlreadyInUse")
//                    DLog("emailAlreadyInUse")
//                    break
//                case .invalidEmail:
//                    completionHandeler(false, "invalidEmail")
//                    DLog("invalidEmail")
//                    break
//                case .weakPassword:
//                    completionHandeler(false, "weakPassword")
//                    DLog("weakPassword")
//                    break
//                default:
//                    DLog("Error: \(error.localizedDescription)")
//                    completionHandeler(false, error.localizedDescription)
//                }
//            } else {
//                DLog("User signs up successfully")
//                self.storeCreateData(completionHandler: completionHandeler)
//
//            }
//        }
//        storeCreateData(completionHandler: (Bool, String) -> ())
    }
    
    func storeCreateData(completionHandler: @escaping ((_ success: Bool,_ message: String)-> ())) {
        var ref: DocumentReference? = nil
        
        ref = db.collection(FirestoreTableInfo.pepul).addDocument(data: [
            "noteDescription": noteDescription,
            "noteTitle": noteTitle])
        { error in
            if let error = error {
                completionHandler(false, error.localizedDescription)
                
            } else {
//                completionHandler(true, "User signs up successfully")
            }
        }
    }
    
//    func updateUserProfileDocument(completionHandler:  @escaping ((_ success: Bool, _ message: String)->())) {
//        let docref = db.collection(FirestoreTableInfo.pepul).document(userInfo.documentID)
//
//        docref.updateData([
//            "emialId": userInfo.emailId,
//            "privacyEnabled": userInfo.privacyEnabled,
//            "userId": userInfo.userId,
//            "userName": userInfo.userName,
//            "createdDate": userInfo.createdDate,
//            "isArchieved": userInfo.isArchieved,
//            "isDeleted": userInfo.isDeleted,
//            "isPinned": userInfo.isPinned,
//            "lastEditDate": userInfo.lastEditedDate,
//            "noteColor": userInfo.noteColor,
//            "noteDescription": userInfo.noteDescription,
//            "noteTitle": userInfo.noteTitle,
//            "noteeType": userInfo.noteType
//        ])
//        { err in
//            if let err = err {
//                completionHandler(false, err.localizedDescription)
//                DLog("Error updating document: \(err)")
//            } else {
//                completionHandler(true, "Document successfully updated")
//                DLog("Document successfully updated")
//            }
//        }
//    }
}
