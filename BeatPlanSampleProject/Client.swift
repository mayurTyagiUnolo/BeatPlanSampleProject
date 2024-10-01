//
//  Untitled.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 01/10/24.
//
import Foundation

class Client {
    var clientName: String?
    var clientID: String?
    var age: Int
    var address: String?
    var employeeID: Int?
    var isSelected: Bool = false
    
    init(clientName: String, age: Int, address: String, clientID: String) {
        self.clientName = clientName
        self.age = age
        self.address = address
        self.clientID = clientID
    }
}
