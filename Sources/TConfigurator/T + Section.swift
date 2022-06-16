//
//  T + Section.swift
//
//  Created by Abdula Magomedov.
//  Copyright © 2020 WeLike. All rights reserved.
//

import UIKit

extension T {
    
    public class Section {
        
        public var cells: [Configurator]
        
        public var titleForHeader: String?
        public var titleForFooter: String?
        public var viewForHeader: UIView?
        public var heightForHeader: CGFloat = 0
        
        public var viewForFooter: UIView?
        public var heightForFooter: CGFloat = 0
        
        public init(_ cells: [Configurator] = []) {
            self.cells = cells
        }
    }
}
