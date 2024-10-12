//
//  winglyApp.swift
//  wingly
//
//  Created by Владимир Попов on 06.10.2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseMessaging

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        defer {
            UNUserNotificationCenter.current().delegate = self

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in }
            )

            application.registerForRemoteNotifications()
            
            Messaging.messaging().delegate = self
                        
            Messaging.messaging().subscribe(toTopic: "announcements") { error in
                print("Subscribed to announcements topic")
            }
        }
        
        FirebaseApp.configure()
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        
        UNUserNotificationCenter.current().setBadgeCount(0)
        
        print(#function)
        
        do {
            try Auth.auth().useUserAccessGroup("3SKSM3SN33.itmo.masters.wingly")
            return true
        } catch let error as NSError {
            print("Error changing user access group: %@", error)
            return false
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().setAPNSToken(deviceToken, type: .unknown)
        
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        setupAndMigrateFirebaseAuth()
    }
    
    func setupAndMigrateFirebaseAuth() {
        guard Auth.auth().userAccessGroup != "3SKSM3SN33.itmo.masters.wingly" else {
            print("Firebase Auth is already using the correct access group \"3SKSM3SN33.itmo.masters.wingly\"")
            return
        }
        print("Firebase Auth is not yet using correct access group \"3SKSM3SN33.itmo.masters.wingly\". Migrating...")
        //for extension (widget) we want to share our auth status
        do {
            //get current user (so we can migrate later)
            let user = Auth.auth().currentUser
            //switch to using app group
            try Auth.auth().useUserAccessGroup("3SKSM3SN33.itmo.masters.wingly")
            //migrate current user
            if let user = user {
                Auth.auth().updateCurrentUser(user) { error in
                    guard error == nil else {
                        print("Auth.auth().updateCurrentUser throws error: \(String(describing: error))")
                        return
                    }
                    print("Firebase Auth user migrated")
                }
            }
            
        } catch let error as NSError {
            print("Auth.auth().useUserAccessGroup throws error: \(error)")
        }
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
         Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print full message.
        print("Full user info: \(userInfo)")
        
        // Change this to your preferred presentation option
        return [[.badge, .alert, .sound]]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let userInfo = response.notification.request.content.userInfo
        
        // [START_EXCLUDE]
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
          print("Message ID: \(messageID)")
        }
        // [END_EXCLUDE]
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
         Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print full message.
        print(userInfo)

        // Get link from notification for further propagation
        var link: String? = nil
        if userInfo["gcm.n.link"] != nil {
            link = userInfo["gcm.n.link"] as? String
        } else if userInfo["poll_from_team_link"] != nil {
            link = userInfo["poll_from_team_link"] as? String
        }
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let tokenDict = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: tokenDict)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
         Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }

        // Print full message.
        print(userInfo)
        // Get link from notification for further propagation
        let link = userInfo["gcm.n.link"] as! String
    }
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any]
    ) async -> UIBackgroundFetchResult {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.

        // With swizzling disabled you must let Messaging know about the message, for Analytics
        Messaging.messaging().appDidReceiveMessage(userInfo)

        // Print message ID.
        if let messageID = userInfo["gcm.message_id"] {
        print("Message ID: \(messageID)")
        }

        // Print full message.
        print(userInfo)
        // Get link from notification for further propagation
        let link = userInfo["gcm.n.link"] as! String

        return UIBackgroundFetchResult.newData
    }
}

@main
struct winglyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
