//
//  BMLoadingView.h
//  
//
//  Created by Jeronimo Valli on 4/27/13.
//

#import <UIKit/UIKit.h>

@interface BMLoadingView : NSObject

@property (nonatomic, retain, readonly) UIView *view;

+ (BOOL)initializeSingletonInstanceForWindow:(UIWindow*)window;
+ (BMLoadingView*)sharedInstance;

@end
