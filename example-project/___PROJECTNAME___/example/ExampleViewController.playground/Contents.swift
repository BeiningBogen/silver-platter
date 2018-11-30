import Foundation
import PlaygroundSupport

let exampleViewController = ExampleViewController.init(nibName: nil, bundle: nil)
let navController = UINavigationController.init(rootViewController: exampleViewController)

PlaygroundPage.current.liveView = navController
