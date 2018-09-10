import Foundation
import ___PROJECTNAME___Api

public struct AppEnvironment {

    fileprivate static var stack: [Environment] = [Environment()]
    public static var current : Environment {
        return stack.last!
    }

    public static func pushEnvironment(environment: Environment) {
        stack.append(environment)
    }

    static func popEnvironment() {
        _ = stack.popLast()
    }

}
