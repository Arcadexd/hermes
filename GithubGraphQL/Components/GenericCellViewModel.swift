//
//  GenericCellViewModel.swift
//  GithubGraphQL
//
//  Created by Felipe Souza on 08/03/22.
//  Copyright © 2022 test. All rights reserved.
//

import Foundation

class GenericCellViewModel {
    private let model: GenericCellModel!
    
    private(set) var title: String?
    private(set) var subtitle: String?
    private(set) var content: String?
    private(set) var imageUrl: String?
    private(set) var value: String?
    
    init(model: GenericCellModel?) {
        self.model = model
        setupData()
    }
    
    private func setupData() {
        title = model.title
        subtitle = model.subTitle
        content = model.content
        imageUrl = model.imageUrl
        value = String(model.value)
    }
}
