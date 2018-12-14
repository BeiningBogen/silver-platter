//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

class ___VARIABLE_tableViewIdentifier___TableViewDataSource: ValueCellDataSource {

    internal func loadData(examples: [String]) {
        set(values: examples, cellClass: ___VARIABLE_cellIdentifier___Cell.self, inSection: 0)
    }

    override func configureCell(tableCell cell: UITableViewCell, withValue value: Any) {
        if let cell = cell as ___VARIABLE_cellIdentifier___Cell {
            if let value = value as? String {
                cell.configureWith(value: value)
            }
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Section 1" : "Secion 2"
    }
}
