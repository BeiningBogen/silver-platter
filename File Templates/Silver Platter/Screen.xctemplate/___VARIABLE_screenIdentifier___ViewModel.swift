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

protocol ___VARIABLE_screenIdentifier___ViewModelInputs {

}

protocol ___VARIABLE_screenIdentifier___ViewModelOutputs {
    var title: Signal<String, NoError> { get }
}

protocol ___VARIABLE_screenIdentifier___ViewModelType {
    var inputs: ___VARIABLE_screenIdentifier___ViewModelInputs { get }
    var outputs: ___VARIABLE_screenIdentifier___ViewModelOutputs { get }
}

class ___VARIABLE_screenIdentifier___ViewModel: ___VARIABLE_screenIdentifier___ViewModelType, ___VARIABLE_screenIdentifier___ViewModelInputs, ___VARIABLE_screenIdentifier___ViewModelOutputs {
    init() {
        title = .empty
    }

    let title: Signal<String, NoError>

    var inputs: ___VARIABLE_screenIdentifier___ViewModelInputs { return self }
    var outputs: ___VARIABLE_screenIdentifier___ViewModelOutputs { return self }
}
