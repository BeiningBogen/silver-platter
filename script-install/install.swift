#!/usr/bin/swift

import Foundation

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

let exampleProject = "example-project"

//print("Repository name:")
let repository = "Grr"//readLine()!

//print("Author name:")
let author = "Simen Fonnes"//readLine()!

//print("Path:")
let path = "~/Documents"//readLine()!

//Should check for correct / usage.
let projectPath = "\(path)/\(repository)"

//print(projectPath)

shell("mkdir", "~", "Documents", "Grr")

//shell("rm -rf", projectPath)





/*





//gen makefile
print("Generating makefile...")

//run makefile
print("Running makefile...")

//pod install
print("Installing pods")

//clean
print("Cleaning project...")

//build targets
print("Building targets...")

//open workspace file
print("Opening workspace file...")

print(repository)
print(author)
print(path)
*/
