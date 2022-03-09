//
//  TableView+IdentifierType.swift
//  GithubGraphQL
//
//  Created by Felipe Souza on 08/03/22.
//  Copyright © 2022 test. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type) where T: ClassIdentifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseId)
    }
    
    func register<T: UITableViewCell>(cellType: T.Type) where T: NibIdentifiable & ClassIdentifiable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseId)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: ClassIdentifiable {
        register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.reuseId)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: NibIdentifiable & ClassIdentifiable {
        register(viewType.nib, forHeaderFooterViewReuseIdentifier: viewType.reuseId)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId) as? T
        else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.reuseId)") }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, forIndexPath indexPath: IndexPath) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId, for: indexPath) as? T
        else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.reuseId)") }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withViewType type: T.Type) -> T where T: ClassIdentifiable {
        guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: type.reuseId) as? T
        else { fatalError("Couldn't dequeue a UITableViewHeaderFooterView with identifier: \(type.reuseId)") }
        return headerFooterView
    }
}

