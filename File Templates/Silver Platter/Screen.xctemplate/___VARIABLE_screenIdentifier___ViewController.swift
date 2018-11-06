//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Cartography

public class ___VARIABLE_screenIdentifier___ViewController : UIViewController {

    let viewModel = ___VARIABLE_screenIdentifier___ViewModel()

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
    }

    func setupViews() {

    }

    func setupConstraints() {
        constrain(view) { (viewProxy) in

        }
    }

    func bindStyles() {
        view.backgroundColor = .white
    }

    func bindViewModel() {

    }
}
