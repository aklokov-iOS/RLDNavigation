#import "RLDPushPopNavigationCommand.h"

#import <UIKit/UIKit.h>

@interface NSRunLoop (Waiting)

+ (void)waitFor:(BOOL(^)(void))conditionBlock withTimeout:(NSTimeInterval)seconds;

@end

@interface NSObject (TestingHelpers)

+ (Class)registerSubclassWithName:(NSString *)name;

+ (Class)registerSubclassWithName:(NSString *)name
               readonlyProperties:(NSArray *)readonlyPropertyNames
              readwriteProperties:(NSArray *)readwritePropertyNames;

@end

@interface RLDTestingNavigationCommand : RLDPushPopNavigationCommand

+ (Class)registerSubclassWithName:(NSString *)name origins:(NSArray *)origins destination:(Class)destination;
+ (void)clearExecutionRegistryAndUnregisterAllSubclasses;
+ (BOOL)hasExecutionOrder:(NSArray *)executionOrder;
+ (BOOL)executed;

@end

@interface RLDCountingNavigationController : UINavigationController

- (void)setRootViewControllerWithClass:(Class)class;
- (BOOL)hasClassChain:(NSArray *)classChain;
- (void)setClassChain:(NSArray *)classChain;

@property (nonatomic, readonly) NSUInteger pushCount;
@property (nonatomic, readonly) NSUInteger popCount;

@end