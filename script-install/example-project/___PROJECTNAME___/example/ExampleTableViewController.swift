import UIKit
import Foundation
import ReactiveCocoa
import ReactiveSwift
import Result
import Cartography

final class ExampleTableViewController: UIViewController {
    var tableView:UITableView!

    let viewModel = ExampleTableViewModel()
    let dataSource = ExampleTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        bindStyles()
        bindViewModel()
        viewModel.inputs.viewDidLoad()
        viewModel.inputs.configure(texts: ["Example1", "Example2", "Example3"])
    }

    func setupViews() {
        tableView = UITableView.init(frame: .zero)
        view.addSubview(tableView)

        tableView.register(ExampleCell.self, forCellReuseIdentifier: ExampleCell.defaultReusableId)

        tableView.delegate = self
        tableView.dataSource = dataSource

        //register tableviewcell
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
        viewModel.outputs
    }
}

extension ExampleTableViewController : UITableViewDelegate {

}
