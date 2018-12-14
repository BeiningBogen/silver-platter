//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Cartography

class ___VARIABLE_cellIdentifier___Cell: UITableViewCell, ValueCell {

    static var defaultReusableId: String = String.init(describing: ___VARIABLE_cellIdentifier___Cell.self)
    typealias Value = ___VARIABLE_cellType___

    let viewModel = ___VARIABLE_cellIdentifier___CellViewModel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addSubviews()
        addGestures()
        setupConstraints()
        bindStyles()
        bindViewModel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureWith(value: ___VARIABLE_cellType___) {
        viewModel.configureWith(value: value)
    }

    func setupViews() {
    }

    func addSubviews() {
    }

    func addGestures() {
    }

    func setupConstraints() {
    }

    func bindStyles() {
    }

    func bindViewModel() {
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
