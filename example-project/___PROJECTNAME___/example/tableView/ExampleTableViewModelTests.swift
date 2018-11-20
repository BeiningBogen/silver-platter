import XCTest
import ReactiveCocoa
import ReactiveSwift
import Result

@testable import ___PROJECTNAME___Framework
@testable import ___PROJECTNAME___Api

class ExampleTableViewModelTests: XCTestCase {
    
    let exampleTableViewModel = ExampleTableViewModel()
    let cells = TestObserver<[String], NoError>()
    
    override func setUp() {
        super.setUp()
        exampleTableViewModel.outputs.cells.observe(cells.observer)
    }
    
    override func tearDown() {}
    
    func testCells() {
        let examples = ["Example1", "Example2", "Example3"]
        exampleTableViewModel.configure(texts: examples)
        cells.assertLastValue(examples)
        XCTAssertEqual(cells.values.count, 1)
    }
}
