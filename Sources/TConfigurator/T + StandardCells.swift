//
//  T + StandardCells.swift
//  Core
//
//  Created by Абдула Магомедов on 10.06.2022.
//  Copyright © 2022 05.ru. All rights reserved.
//

import UIKit

//MARK: - SpacingCell
private final class SpacingCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension T {
    
    public class SpacingConfigurator: NSObject, T.Configurator {
        
        public var identifier: String { "SpacingCell" }
        
        private let height: CGFloat
        private let backgroundColor: UIColor
        
        public init(height: CGFloat, backgroundColor: UIColor) {
            self.height = height
            self.backgroundColor = backgroundColor
        }
        
        public func config(cell: UITableViewCell) {
            cell.contentView.backgroundColor = backgroundColor
        }
        
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return height
        }
        
        public static func registerForTableView(_ tableView: UITableView) {
            tableView.register(SpacingCell.self, forCellReuseIdentifier: "SpacingCell")
        }
    }
}


//MARK: - ActivityIndicatorCell

private final class ActivityIndicatorCell: UITableViewCell {
    
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(activityIndicator)
        
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


extension T {

    public class ActivityIndicatorConfigurator: NSObject, T.Configurator {
        
        public var identifier: String { "ActivityIndicatorCell" }
        
        private let style: UIActivityIndicatorView.Style
        private let height: CGFloat
        private let backgroundColor: UIColor
        
        public init(style: UIActivityIndicatorView.Style, height: CGFloat, backgroundColor: UIColor) {
            self.style = style
            self.height = height
            self.backgroundColor = backgroundColor
        }
        
        public func config(cell: UITableViewCell) {
            guard let cell = cell as? ActivityIndicatorCell else { return }
            
            cell.contentView.backgroundColor = backgroundColor
            cell.activityIndicator.style = self.style
            
            cell.activityIndicator.startAnimating()
        }
        
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return height
        }
        
        public static func registerForTableView(_ tableView: UITableView) {
            tableView.register(ActivityIndicatorCell.self, forCellReuseIdentifier: "ActivityIndicatorCell")
        }
    }
}
