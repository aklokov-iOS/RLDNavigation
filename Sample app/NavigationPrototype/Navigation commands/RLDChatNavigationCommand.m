#import "RLDChatNavigationCommand.h"

#import <UIKit/UIKit.h>
#import "RLDNavigationSetup.h"
#import "RLDProfileViewController.h"

static NSString *const originClassNameConnections = @"RLDConnectionsViewController";
static NSString *const originClassNameProfile = @"RLDProfileViewController";

static NSString *const destinationClassName = @"RLDChatViewController";

@implementation RLDChatNavigationCommand

#pragma mark - Idoneity checking

+ (BOOL)canHandleNavigationSetup:(RLDNavigationSetup *)navigationSetup {
    BOOL canHandleNavigationSetup = [super canHandleNavigationSetup:navigationSetup];
    
    if (canHandleNavigationSetup) {
        UIViewController * topViewController =navigationSetup.navigationController.topViewController;
        if (topViewController.class == NSClassFromString(originClassNameProfile)) {
            NSString *userId = navigationSetup.properties[@"userId"] ? navigationSetup.properties[@"userId"] : nil;
            canHandleNavigationSetup = [[(RLDProfileViewController *)topViewController userId] isEqualToString:userId];
        }
    }
    
    return canHandleNavigationSetup;
}

+ (NSArray *)origins {
    return @[NSClassFromString(originClassNameConnections),
             NSClassFromString(originClassNameProfile)];
}

+ (Class)destination {
    return NSClassFromString(self.viewControllerStoryboardIdentifier);
}

+ (NSString *)viewControllerStoryboardIdentifier {
    return destinationClassName;
}

@end
