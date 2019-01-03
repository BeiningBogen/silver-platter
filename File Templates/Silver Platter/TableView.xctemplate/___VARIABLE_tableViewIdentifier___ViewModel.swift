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

public protocol ___VARIABLE_tableViewIdentifier___ViewModelInputs {
    func viewDidLoad()
    func configure(texts: [String])
}

public protocol ___VARIABLE_tableViewIdentifier___ViewModelOutputs {
    var cells: Signal<[String], NoError> { get }
}

public protocol ___VARIABLE_tableViewIdentifier___ViewModelType {
    var inputs: ___VARIABLE_tableViewIdentifier___ViewModelInputs { get }
    var outputs: ___VARIABLE_tableViewIdentifier___ViewModelOutputs { get }
}

public class ___VARIABLE_tableViewIdentifier___ViewModel: ___VARIABLE_tableViewIdentifier___ViewModelType, ___VARIABLE_tableViewIdentifier___ViewModelInputs, ___VARIABLE_tableViewIdentifier___ViewModelOutputs {
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

    public var inputs: ___VARIABLE_tableViewIdentifier___ViewModelInputs { return self }
    public var outputs: ___VARIABLE_tableViewIdentifier___ViewModelOutputs { return self }
}
