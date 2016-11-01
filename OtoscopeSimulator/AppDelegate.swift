//
//  AppDelegate.swift
//  OttoscopeSimulator
//
//  Created by John Holcroft on 30/01/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UserStore().signOut()

        if !_isDebugAssertConfiguration() {
            setupAnalytics()
        }
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        setNavigationBarAppearance()
        
        return true
    }
    
    func setupAnalytics() {
        // Configure tracker from GoogleService-Info.plist.
        var configureError:NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        // Optional: configure GAI options.
        if let gai = GAI.sharedInstance() {
            gai.trackUncaughtExceptions = true  // report uncaught exceptions
        }
    }

    
    func getInitialViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var initialViewController = storyboard.instantiateViewController(withIdentifier: "LandingPage")
        
        if UserStore().isUserLoggedIn() {
            initialViewController = storyboard.instantiateViewController(withIdentifier: "SuiteChoice")
        }
        
        return initialViewController
    }
    
    func setNavigationBarAppearance() {
        //        let logoBlue = UIColor(red: 3/255, green: 159/255, blue: 149/255, alpha: 1)
        //        let logoGreen = UIColor(red: 51/255, green: 172/255, blue: 64/255, alpha: 1)
        let defaultLightBlue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        
        UINavigationBar.appearance().barTintColor = defaultLightBlue
        UINavigationBar.appearance().tintColor = UIColor(white: 1.0, alpha: 0.8)
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
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
        
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let facebookOpenResult = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        let googleOpenResult = GIDSignIn.sharedInstance().handle(url,
                                                                 sourceApplication: options[.sourceApplication] as? String,
                                                                 annotation: options[.annotation])
        return facebookOpenResult || googleOpenResult
    }
}

