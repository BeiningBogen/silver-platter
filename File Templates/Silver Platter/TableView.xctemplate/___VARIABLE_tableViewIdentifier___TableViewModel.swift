//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import ReactiveCocoa
import ReactiveSwift
import Result

public protocol ___VARIABLE_tableViewIdentifier___TableViewModelInputs {
    func viewDidLoad()
    func configure(texts: [String])
}

public protocol ___VARIABLE_tableViewIdentifier___TableViewModelOutputs {
    var cells: Signal<[String], NoError> { get }
}

public protocol ___VARIABLE_tableViewIdentifier___TableViewModelType {
    var inputs: ___VARIABLE_tableViewIdentifier___TableViewModelInputs { get }
    var outputs: ___VARIABLE_tableViewIdentifier___TableViewModelOutputs { get }
}

public class ___VARIABLE_tableViewIdentifier___TableViewModel: ___VARIABLE_tableViewIdentifier___TableViewModelType, ___VARIABLE_tableViewIdentifier___TableViewModelInputs, ___VARIABLE_tableViewIdentifier___TableViewModelOutputs {
    init() {
        cells = configureWithTextProperty.signal.skipNil()
    }

    let viewDidLoadProperty = MutableProperty(())
    public func viewDidLoad() {
        viewDidLoadProperty.value = ()
    }

    let configureWithTextProperty = MutableProperty<[String]?>(nil)
    public func configure(texts: [String]) {
        configureWithTextProperty.value = texts
    }

    public let cells: Signal<[String], NoError>

    public var inputs: ___VARIABLE_tableViewIdentifier___TableViewModelInputs { return self }
    public var outputs: ___VARIABLE_tableViewIdentifier___TableViewModelOutputs { return self }
}
