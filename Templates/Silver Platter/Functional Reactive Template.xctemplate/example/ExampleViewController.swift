//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Cartography

public class ExampleViewController : UIViewController {
    
    public let exampleViewModel = ExampleViewModel()
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        bindStyles()
        bindViewModel()
        exampleViewModel.inputs.viewDidLoad()
    }
    
    func bindStyles() {
        view.backgroundColor = .white
    }
    
    func bindViewModel() {
        exampleViewModel.outputs.goBack.observeValues{ [weak self] _ in
            guard let s = self else {return}
            s.navigationController?.popViewController(animated: true)
        }
    }
    
    func setupViews() {
        
    }
    
    func setupConstraints() {
        constrain(view) { (viewProxy) in
            
        }
    }
}
