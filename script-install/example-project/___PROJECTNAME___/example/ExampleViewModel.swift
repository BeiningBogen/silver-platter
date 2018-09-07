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
    }
    
    let viewDidLoadProperty = MutableProperty(())
    public func viewDidLoad() {
        viewDidLoadProperty.value = ()
    }
    
    public let goBack: Signal<Void, NoError>
    
    public var inputs: StoreViewModelInputs { return self }
    public var outputs: StoreViewModelOutputs { return self }
}
