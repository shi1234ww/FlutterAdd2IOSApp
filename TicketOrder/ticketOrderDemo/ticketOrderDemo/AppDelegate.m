//
//  AppDelegate.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //     Override point for customization after application launch.
        self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter" project:nil];
    //     Runs the default Dart entrypoint with a default Flutter route.
    //    [self.flutterEngine run];
        [self.flutterEngine runWithEntrypoint:nil];
        // Used to connect plugins (only if you have plugins with iOS platform code).
    //    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
       
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
