//
//  Extension.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import Foundation
public extension Encodable {
  var dictionary: [String: String] {
    guard let data = try? JSONEncoder().encode(self) else { return [:] }
    return (try? JSONSerialization.jsonObject(with: data,
                                              options: .allowFragments)).flatMap { $0 as? [String: String] } ?? [:]
  }
}
import Foundation
import UIKit

extension UITableView {

    func registerNib(_ type: UITableViewCell.Type, bundle: Bundle) {
        register(
            UINib(nibName: type.identifier, bundle: bundle),
            forCellReuseIdentifier: type.identifier
        )
    }

    func dequeueCell<CellType: UITableViewCell>(type: CellType.Type, indexPath: IndexPath) -> CellType {
        guard let cell = dequeueReusableCell(withIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("Wrong type of cell \(type)")
        }
        return cell
    }
}

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
