//
//  AppDelegate.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /*
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "StartScreenViewController") as! StartScreenViewController
        let nav = UINavigationController(rootViewController: homeViewController)
        appdelegate.window!.rootViewController = nav
        */
        /*
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var startScreenViewController: StartScreenViewController = mainStoryboard.instantiateViewController(withIdentifier: "StartScreenViewController") as! StartScreenViewController
        
        self.window?.rootViewController = startScreenViewController
        
        self.window?.makeKeyAndVisible()
        
        return true
        */
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        /*
        // MARK: Style Navigation Bar
        nav.navigationBar.barTintColor = UIColor(rgb: 0x3e7aab)
        nav.navigationBar.tintColor = UIColor.white
        let navigationBarAppearace = UINavigationBar.appearance()
        let font = UIFont(name: "Helvetica-Bold", size: 16)
        if let font = font {
            navigationBarAppearace.titleTextAttributes = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor.white];
        }
        */
        // MARK: Launch the Main View
        let mainViewController = StartScreenViewController()
        nav.viewControllers = [mainViewController]
        self.window?.rootViewController = nav
        //self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

