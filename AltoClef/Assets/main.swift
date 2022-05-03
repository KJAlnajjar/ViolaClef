//
//  main.swift
//  AltoClef
//
//  Created by Khalil AlNajjar on 25/04/2022.
//

import UIKit

let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc,
                  CommandLine.unsafeArgv,
                  nil,
                  NSStringFromClass(appDelegateClass))
