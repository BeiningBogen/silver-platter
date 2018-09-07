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

public protocol ExampleViewModelInputs {
    func viewDidLoad()
    func configure(text:String)
}

public protocol ExampleViewModelOutputs {
    var goBack: Signal<Void, NoError> { get }
}

public protocol ExampleViewModelType {
    var inputs: ExampleViewModelInputs { get }
    var outputs: ExampleViewModelOutputs { get }
}

public class ExampleViewModel: ExampleViewModelType, ExampleViewModelInputs, ExampleViewModelOutputs {
    init() {
        goBack = .empty
        configureWithTextProperty = .empty
    }

    let viewDidLoadProperty = MutableProperty(())
    public func viewDidLoad() {
        viewDidLoadProperty.value = ()
    }

    let configureWithTextProperty = MutableProperty<String?>(nil)
    public func configure(text: String) {
        configureWithSubjectProperty.value = text
    }

    public let goBack: Signal<Void, NoError>

    public var inputs: StoreViewModelInputs { return self }
    public var outputs: StoreViewModelOutputs { return self }
}
