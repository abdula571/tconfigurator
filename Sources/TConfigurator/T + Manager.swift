//
//  T + Manager.swift
//
//  Created by Abdula Magomedov.
//  Copyright © 2020 WeLike. All rights reserved.
//

import UIKit

extension T {

    open class Manager: NSObject, UITableViewDataSource, UITableViewDelegate {
        
        public typealias WillDisplayHandler = (_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void
        
        public var willDisplayHandler: WillDisplayHandler?
        
        public var sections: [Section] = []

        public override init() {
            super.init()
        }
        
        public init(_ sections: [Section]) {
            self.sections = sections
        }

        public init(_ cells: [T.Configurator]) {
            self.sections = [T.Section(cells)]
        }

        open func numberOfSections(in tableView: UITableView) -> Int {
            return sections.count
        }

        open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sections[section].cells.count
        }

        open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sections[section].titleForHeader
        }

        open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            return sections[section].titleForFooter
        }
        
        open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            sections[section].viewForFooter
        }

        open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            sections[section].viewForHeader
        }

        open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            sections[section].heightForFooter
        }

        open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            sections[section].heightForHeader
        }
        
        open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            sections[indexPath.section].cells[indexPath.row].tableView?(tableView, heightForRowAt: indexPath) ?? UITableView.automaticDimension
        }
        
        open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            sections[indexPath.section].cells[indexPath.row].tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? UITableView.automaticDimension
        }
        
        open func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            sections[indexPath.section].cells[indexPath.row].tableView?(tableView, leadingSwipeActionsConfigurationForRowAt: indexPath)
        }
        
        open func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            sections[indexPath.section].cells[indexPath.row].tableView?(tableView, trailingSwipeActionsConfigurationForRowAt: indexPath)
        }

        open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let configurator = sections[indexPath.section].cells[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: configurator.identifier, for: indexPath)

            configurator.config(cell: cell)

            return cell
        }
        
        open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            sections[indexPath.section].cells[indexPath.row].tableView?(tableView, didSelectRowAt: indexPath)
        }
        
        open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            willDisplayHandler?(tableView, cell, indexPath)
        }

        open func deleteCells(at indexPaths: [IndexPath]) {

            indexPaths.forEach { (indexPath) in
                self.sections[indexPath.section].cells.remove(at: indexPath.row)
            }
        }
    }
}

