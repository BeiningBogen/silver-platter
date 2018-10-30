import Foundation
import ReactiveCocoa
import ReactiveSwift

class ExampleTableViewDataSource: ValueCellDataSource {
    
    internal func loadData(examples: [Property<String>]) {
        set(values: examples, cellClass: ExampleCell.self, inSection: 0)
    }
    
    override func configureCell(collectionCell cell: UICollectionViewCell, withValue value: Any) {
        let exampleCell = cell as? ExampleCell
        exampleCell?.configureWith(value: value as! Property<String>)
    }
    
    
}

