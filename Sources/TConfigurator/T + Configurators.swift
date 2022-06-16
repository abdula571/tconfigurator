//
//  T + Configurators.swift
//  05.ru
//
//  Created by Abdula Magomedov on 08.07.2021.
//  Copyright © 2021 05.ru. All rights reserved.
//

import UIKit

extension T {
    
    public final class DefaultConfigurator<I: T.Configurable>: BaseConfigurator<I>, Configurator {
    
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
        }
        
        public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            (tableView.cellForRow(at: indexPath) as? I)?.didSelect(in: tableView, at: indexPath)
        }
    }
}

extension T.Configurable {
    
    public static func assemble(_ data: DTO, delegate: Delegate? = nil) -> T.Configurator  {
        T.DefaultConfigurator<Self>(data: data, delegate: delegate)
    }
}
