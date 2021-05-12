//
//  User.swift
//  TechincalProject
//
//  Created by Kazim Walji on 5/10/21.
//

import Foundation
import UIKit

class User {
    static var shared = User()
    var firstName: String?
    var lastName: String?
    var dob: String?
    var licenseNo: String?
    var licenseImage: UIImage?
    
    init() {
    }
}
