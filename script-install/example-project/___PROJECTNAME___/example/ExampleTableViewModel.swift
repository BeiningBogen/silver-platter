import ReactiveCocoa
import ReactiveSwift
import Result

public protocol ExampleTableViewModelInputs {
    func viewDidLoad()
    func configure(texts: [String])
}

public protocol ExampleTableViewModelOutputs {
}

public protocol ExampleTableViewModelType {
    var inputs: ExampleTableViewModelInputs { get }
    var outputs: ExampleTableViewModelOutputs { get }
}

public class ExampleTableViewModel: ExampleTableViewModelType, ExampleTableViewModelInputs, ExampleTableViewModelOutputs {
    init() {
    }
    
    let viewDidLoadProperty = MutableProperty(())
    public func viewDidLoad() {
        viewDidLoadProperty.value = ()
    }
    
    let configureWithTextProperty = MutableProperty<String?>(nil)
    public func configure(text: String) {
        configureWithTextProperty.value = text
    }
    
    public var inputs: ExampleTableViewModelInputs { return self }
    public var outputs: ExampleTableViewModelOutputs { return self }
}
