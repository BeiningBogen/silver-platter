//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import ReactiveCocoa
import ReactiveSwift
import Result

public protocol ___VARIABLE_tableViewCell___ViewModelInputs {
    func configureWith(value: ___VARIABLE_cellType___)
}

public protocol ___VARIABLE_tableViewCell___ViewModelOutputs {
    var title: Signal<String, NoError> { get }
}

public protocol ___VARIABLE_tableViewCell___CellViewModelType {
    var inputs: ___VARIABLE_tableViewCell___CellViewModelInputs { get }
    var outputs: ___VARIABLE_tableViewCell___CellViewModelOutputs { get }
}

class ___VARIABLE_tableViewCell___CellViewModel: ___VARIABLE_tableViewCell___CellViewModelType, ___VARIABLE_tableViewCell___CellViewModelInputs, ___VARIABLE_tableViewCell___CellViewModelOutputs {

    init() {
        title = configureWithProperty.signal.skipNil()
    }

    private let configureWithProperty = MutableProperty<String?>(nil)
    func configureWith(value: ___VARIABLE_cellType___) {
        configureWithProperty.value = value
    }

    public let title: Signal<String, NoError>

    var inputs: ___VARIABLE_tableViewCell___CellViewModelInputs { return self }
    var outputs: ___VARIABLE_tableViewCell___CellViewModelOutputs { return self }
}
