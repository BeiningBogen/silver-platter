//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Foundation
import ReactiveCocoa
import ReactiveSwift
import Result
import Cartography

final class ___VARIABLE_tableViewIdentifier___ViewController: UIViewController {
    var tableView:UITableView!

    let viewModel = ___VARIABLE_tableViewIdentifier___ViewModel()
    let dataSource = ___VARIABLE_tableViewIdentifier___DataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        bindStyles()
        bindViewModel()
        viewModel.inputs.viewDidLoad()
    }

    func setupViews() {
        tableView = UITableView.init(frame: .zero)
        view.addSubview(tableView)

        tableView.register(___VARIABLE_tableViewCell___.self, forCellReuseIdentifier: ___VARIABLE_tableViewCell___.defaultReusableId)

        tableView.delegate = self
        tableView.dataSource = dataSource
    }

    func setupConstraints() {
        constrain(view, tableView) { viewProxy, tableViewProxy in
            tableViewProxy.top == viewProxy.top
            tableViewProxy.left == viewProxy.left
            tableViewProxy.right == viewProxy.right
            tableViewProxy.bottom == viewProxy.bottom
        }
    }

    func bindStyles() {
        tableView.backgroundColor = .white
    }

    func bindViewModel() {
        viewModel.outputs.cells.observeValues{ [weak self] cells in
            self?.dataSource.loadData(examples: cells)
            self?.tableView.reloadData()
        }
    }
}

extension ___VARIABLE_tableViewIdentifier___ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
