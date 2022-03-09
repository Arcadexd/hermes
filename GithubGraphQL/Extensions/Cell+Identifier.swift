//
//  Cell+Identifier.swift
//  GithubGraphQL
//
//  Created by Felipe Souza on 08/03/22.
//  Copyright © 2022 test. All rights reserved.
//

import Foundation

protocol ClassIdentifiable: AnyObject {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    static var reuseId: String {
        return String(describing: self)
    }
}
