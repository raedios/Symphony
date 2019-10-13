//
//  Author.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-13.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

struct Author: Decodable {

    // MARK: - Properties

    var id: Int
    var name: String
    var userName: String
    var email: String
    var avatarUrl: String
    var address: Address
}
