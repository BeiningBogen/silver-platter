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

protocol ___VARIABLE_controllerIdentifier___ViewModelInputs {

}

protocol ___VARIABLE_controllerIdentifier___ViewModelOutputs {
    var title: Signal<String, NoError> { get }
}

protocol ___VARIABLE_controllerIdentifier___ViewModelType {
    var inputs: ___VARIABLE_controllerIdentifier___ViewModelInputs { get }
    var outputs: ___VARIABLE_controllerIdentifier___ViewModelOutputs { get }
}

class ___VARIABLE_controllerIdentifier___ViewModel: ___VARIABLE_controllerIdentifier___ViewModelType, ___VARIABLE_controllerIdentifier___ViewModelInputs, ___VARIABLE_controllerIdentifier___ViewModelOutputs {
    init() {
        title = .empty
    }

    let title: Signal<String, NoError>

    var inputs: ___VARIABLE_controllerIdentifier___ViewModelInputs { return self }
    var outputs: ___VARIABLE_controllerIdentifier___ViewModelOutputs { return self }
}
