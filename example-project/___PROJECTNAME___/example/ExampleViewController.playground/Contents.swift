import Foundation
import ___VARIABLE_productName___Api
import PlaygroundSupport
import ___VARIABLE_productName___Framework

let exampleViewController = ExampleViewController.init(nibName: nil, bundle: nil)
let navController = UINavigationController.init(rootViewController: exampleViewController)

PlaygroundPage.current.liveView = navController
