//
//  GlobalFunctions.swift
//  FBDemo
//
//  Created by mac on 10/12/21.
//
import Foundation

func delay(time: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        closure()
    }
}

func DLog(_ items: Any?..., function: String = #function, file: String = #file, line: Int = #line) {
    if Application.debug {
        print("-----------START------------- \(Date())")
        let url = NSURL(fileURLWithPath: file)
        print("Message = ", items, "\n\n(File: ", url.lastPathComponent ?? "nil", ", Function: ", function, ", Line: ", line, ")")
        print("-----------END------------- \(Date())\n")
    }
}

struct Application {
    static let debug = true
    static let isInDevlopment = true
}
