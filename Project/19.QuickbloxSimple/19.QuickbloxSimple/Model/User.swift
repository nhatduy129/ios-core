//
//  User.swift
//  19.QuickbloxSimple
//
//  Created by Duy Nguyen on 29/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

struct QBUser {
    var id: Int?
    var username: String?
    var email: String?
    var password: String?
    
    init(id: Int, username: String, password: String, email: String) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
    }
}
