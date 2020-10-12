//
//  main.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/11/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import UIKit

CommandLine.unsafeArgv.withMemoryRebound(to:
                                            UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)) {argv in
    _ = UIApplicationMain(CommandLine.argc, argv,
                          NSStringFromClass(Application.self), NSStringFromClass(AppDelegate.self))
}
