//
//  AppDelegate.m
//  MovieDB OBJC
//
//  Created by João Brentano on 21/03/22.
//

#import "AppDelegate.h"
//#import "Model/Movie.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Movie da api mockado
//    Movie* movie = [Movie alloc];
//    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
//    [dict setObject:[NSNumber numberWithBool:YES] forKey:@"adult"];
//    [dict setValue:@"sadhaiud87ads" forKey:@"backdrop_path"];
//    [movie initWithJSONDictionary:dict];
    
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
