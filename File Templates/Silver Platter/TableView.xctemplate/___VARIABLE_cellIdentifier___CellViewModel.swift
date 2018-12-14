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

public protocol ___VARIABLE_cellIdentifier___CellViewModelInputs {
    func configureWith(example: String)
}

public protocol ___VARIABLE_cellIdentifier___CellViewModelOutputs {
    var title: Signal<String, NoError> { get }
}

public protocol ___VARIABLE_cellIdentifier___CellViewModelType {
    var inputs: ___VARIABLE_cellIdentifier___CellViewModelInputs { get }
    var outputs: ___VARIABLE_cellIdentifier___CellViewModelOutputs { get }
}

class ___VARIABLE_cellIdentifier___CellViewModel: ___VARIABLE_cellIdentifier___CellViewModelType, ___VARIABLE_cellIdentifier___CellViewModelInputs, ___VARIABLE_cellIdentifier___CellViewModelOutputs {

    init() {
        title = configureWithProperty.signal.skipNil()
    }

    private let configureWithProperty = MutableProperty<String?>(nil)
    func configureWith(example: String) {
        configureWithProperty.value = example
    }

    public let title: Signal<String, NoError>

    var inputs: ___VARIABLE_cellIdentifier___CellViewModelInputs { return self }
    var outputs: ___VARIABLE_cellIdentifier___CellViewModelOutputs { return self }
}
