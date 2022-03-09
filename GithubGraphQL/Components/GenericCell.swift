//
//  GenericCell.swift
//  GithubGraphQL
//
//  Created by Felipe Souza on 08/03/22.
//  Copyright © 2022 test. All rights reserved.
//

import UIKit

class GenericCell: UITableViewCell, ClassIdentifiable {
    static var reuseId: String = String(describing: GenericCell.self)
    
    // UI Elements
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.numberOfLines = 5
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.regular(ofSize: 30)
        
        return lbl
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .green
        return stackView
    }()
    
    public var viewModel: GenericCellViewModel? {
        didSet {
            loadData()
        }
    }
    
    private var unwrappedViewModel: GenericCellViewModel {
        guard let unwrappedViewModel = viewModel else {
            return GenericCellViewModel()
        }
        
        return unwrappedViewModel
    }
    
    func loadData() {
        setupContentStackView()
        title.text = "Presenting Test"
        let infoStackView = StackView.setupStackView(arrangedSubviews: [title], axis: .vertical, alignment: .leading, distribution: .fill)
        contentStackView.addArrangedSubview(infoStackView)
        layoutIfNeeded()
    }
    
    func setupContentStackView() {
        addSubview(contentStackView)
        
        contentStackView
            .verticalToSuperview(16)
            .horizontalToSuperview(16)
    }
}
