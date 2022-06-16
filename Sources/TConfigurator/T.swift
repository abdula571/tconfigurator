//
//  T.swift
//
//  Created by Abdula Magomedov.
//  Copyright © 2020 WeLike. All rights reserved.
//

import UIKit

public protocol T_Configurator: UITableViewDelegate {
    
    var identifier: String { get }
    
    func config(cell: UITableViewCell)
}

public protocol T_Configurable {
    
    associatedtype DTO
    associatedtype Delegate
    
    static var identifier: String { get }
    
    func config(_ data: DTO!, delegate: Delegate?)
    
    func didSelect(in tableView: UITableView, at indexPath: IndexPath)
}

extension T_Configurable {
    public func didSelect(in tableView: UITableView, at indexPath: IndexPath) {}
}

extension T_Configurable where Self: UITableViewCell {
    
    public static func registerForTable(_ tableView: UITableView) {
        tableView.register(Self.self, forCellReuseIdentifier: Self.identifier)
    }
}

public class T {
    public typealias Configurable = T_Configurable
    public typealias Configurator = T_Configurator
    
    open class BaseConfigurator<I: T.Configurable>: NSObject {
        
        private weak var _delegate: AnyObject?
        
        public private(set) var data: I.DTO
        
        public var delegate: I.Delegate? {
            _delegate as? I.Delegate
        }
        
        public var identifier: String = I.identifier
        
        public func config(cell: UITableViewCell) {
            (cell as? I)?.config(data, delegate: delegate)
        }
        
        public init(data: I.DTO, delegate: I.Delegate? = nil) {
            self.data = data
            self._delegate = delegate as AnyObject
        }
    }
}
