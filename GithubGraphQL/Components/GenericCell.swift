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
    
    public var viewModel: GenericCellViewModel? {
        didSet {
            clearCell()
            loadData()
        }
    }
    
    private var unwrappedViewModel: GenericCellViewModel {
        guard let unwrappedViewModel = viewModel else {
            fatalError("Something wrong happened with the GenericCellViewModel!")
        }
        
        return unwrappedViewModel
    }
    
    // UI Elements
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.heightTo(60).widthTo(60)
        return image
    }()
    
    private lazy var valueCountImage: UIImageView = {
        let image = UIImageView()
        image.heightTo(20).widthTo(20)
        return image
    }()
    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.numberOfLines = 5
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.regular(ofSize: 30)
        
        return lbl
    }()
    
    private lazy var subTitle: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.numberOfLines = 5
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.regular(ofSize: 20)
        
        return lbl
    }()
    
    private lazy var value: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.numberOfLines = 5
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.regular(ofSize: 10)
        
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
        //        stackView.backgroundColor = .green
        return stackView
    }()
    
    func loadData() {
        setupData()
        setupUI()
    }
    
    private func setupData() {
        title.text = unwrappedViewModel.title
        subTitle.text = unwrappedViewModel.subtitle
        value.text = unwrappedViewModel.value
        
        profileImage.loadImageUsingCache(withUrl: unwrappedViewModel.imageUrl ?? "")
        
        valueCountImage.image = UIImage(named: "star")?.withRenderingMode(.alwaysTemplate)
        valueCountImage.tintColor = .green
    }
    
    private func setupUI() {
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        setupStackViewsForData()
        setupContentStackView()
        
        layoutIfNeeded()
    }
    
    func setupStackViewsForData() {
        let countValueStackView = StackView.setupStackView(arrangedSubviews: [valueCountImage, value], axis: .vertical, alignment: .center)
        let trailingStackView = StackView.setupStackView(arrangedSubviews: [countValueStackView], axis: .horizontal, alignment: .trailing)
        let infoStackView = StackView.setupStackView(arrangedSubviews: [title, subTitle], axis: .vertical, alignment: .leading)
        let imageAndInfoStackView = StackView.setupStackView(arrangedSubviews: [profileImage, infoStackView, trailingStackView], alignment: .center, spacing: 8)
        contentStackView.addArrangedSubview(imageAndInfoStackView)
    }
    
    private func setupContentStackView() {
        addSubview(contentStackView)
        
        contentStackView
            .verticalToSuperview(16)
            .horizontalToSuperview(16)
    }
    
    func clearCell() {
        contentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        contentStackView.removeFromSuperview()
    }
}
