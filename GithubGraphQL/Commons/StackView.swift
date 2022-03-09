//
//  StackView.swift
//  GithubGraphQL
//
//  Created by Felipe Souza on 08/03/22.
//  Copyright © 2022 test. All rights reserved.
//

import UIKit

class StackView {
    static func setupStackView(arrangedSubviews: [UIView],
                               axis: NSLayoutConstraint.Axis = .horizontal,
                               alignment: UIStackView.Alignment = .fill,
                               distribution: UIStackView.Distribution = .fill,
                               spacing: CGFloat = 0,
                               clipsToBounds: Bool = true,
                               translatesAutoresizingMaskIntoConstraints: Bool = false ) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        stackView.clipsToBounds = clipsToBounds
        stackView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        return stackView
    }
}
