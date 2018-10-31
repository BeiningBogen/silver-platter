import XCTest
import ReactiveCocoa
import ReactiveSwift
import Result

@testable import ___PROJECTNAME___Framework
@testable import ___PROJECTNAME___Api

class ExampleCell2ViewModelTests: XCTestCase {
    
    let exampleCell2ViewModel = ExampleCell2ViewModel()
    let title = TestObserver<String, NoError>()
    
    override func setUp() {
        super.setUp()
        exampleCell2ViewModel.outputs.title.observe(title.observer)
    }
    
    override func tearDown() {}
    
    func testTitle() {
        exampleCell2ViewModel.inputs.configureWith(example: "Example")
        title.assertLastValue("Example")
        XCTAssertEqual(title.values.count, 1)
    }
}
