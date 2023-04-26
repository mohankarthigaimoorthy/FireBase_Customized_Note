//
//  UserMode.swift
//  customizeNote
//
//  Created by Mohan K on 18/04/23.
//


class UserMode {
    
    var documentID = ""
    var emailId = ""
    var privacyEnabled = ""
    var userId = ""
    var userName = ""
    var createdDate = ""
    var isArchieved = ""
    var isDeleted = ""
    var isPinned = ""
    var lastEditedDate = ""
    var noteColor = ""
    var noteDescription = ""
    var noteTitle = ""
    var noteType = ""
    
    init () { }
       init(json: [String: Any], documentID: String = "")
        {
            self.documentID = documentID
            self.emailId = json["emailId"] as? String ?? ""
            self.privacyEnabled = json["privacyEnabled"] as? String ?? ""
            self.userId = json["userId"] as? String ?? ""
            self.userName = json["userName"] as? String ?? ""
            self.createdDate = json["createdDate"] as? String ?? ""
            self.isArchieved = json["isArchieved"] as? String ?? ""
            self.isDeleted = json["isDeleted"] as? String
            ?? ""
            self.isPinned = json["isPinned"] as? String ?? ""
            self.lastEditedDate = json["lastEditedDate"] as? String ?? ""
            self.noteColor = json["noteColor"] as? String ?? ""
            self.noteDescription = json["noteDescription"] as? String ?? ""
            self.noteTitle = json["noteTitle"] as? String ?? ""
            self.noteType = json["noteType"] as? String ?? ""
        }
    
}
