//
//  AppDelegate.swift
//  BackgroundBeacon
//
//  Created by Neal Zhu on 10/10/17.
//  Copyright © 2017 Neal Zhu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate {

    var window: UIWindow?
    
    let beaconManager = ESTBeaconManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ESTConfig.setupAppID("backgroundbeacon-n8z", andAppToken: "623e6e6bf0611278a7d042b262e55a43")
        
        // Override point for customization after application launch.
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
        UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: .alert, categories: nil))
        self.beaconManager.startMonitoring(for: CLBeaconRegion(
            proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
            major: 45268, minor: 1, identifier: "0f61097c46e1d1b6c5cfaa35cb89c20d"))
        return true
    }
    
//    func beaconManager(_ manager: Any, didDetermineState state: CLRegionState) {
//        print("Determined initial state: for - \(self.name(state)).")
//    }
//
//    func name(_ state: CLRegionState) -> String {
//        switch state {
//        case .unknown: return "Unknown"
//        case .inside: return "Inside"
//        case .outside: return "Outside"
//        }
//    }
    
//    func beaconManager(_ manager: Any, didExit region: CLBeaconRegion) {
//        print ("yea")
//        let notification = UILocalNotification()
//        notification.alertBody = " exit Range "
//        UIApplication.shared.presentLocalNotificationNow(notification)
//    }
    
    func beaconManager(_ manager: Any, didEnter region: CLBeaconRegion) {
        print ("yea")
        let notification = UILocalNotification()
        notification.alertBody = " Enter Range "
        UIApplication.shared.presentLocalNotificationNow(notification)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

