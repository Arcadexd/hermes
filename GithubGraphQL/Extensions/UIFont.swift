//
//  UIFont.swift
//  GithubGraphQL
//
//  Created by Felipe Souza on 08/03/22.
//  Copyright © 2022 test. All rights reserved.
//

import UIKit

extension UIFont {
    
    public static func regular(ofSize size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size)
    }
    
    public static func medium(ofSize size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    public static func bold(ofSize size: CGFloat) -> UIFont {
        UIFont.boldSystemFont(ofSize: size)
    }
    
    public static func semiBold(ofSize size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .semibold)
    }
}
