//
//  BMLoadingView.m
//
//  Created by Jeronimo Valli on 4/27/13.
//

#import "BMLoadingView.h"

static BMLoadingView *_instance = nil;


@interface BMLoadingView ()

@property (nonatomic, retain) UIView *viewBackground;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

- (id)initWithFrame:(CGRect)aRect;

@end


@implementation BMLoadingView

@synthesize viewBackground = _viewBackground;
@synthesize activityIndicator = _activityIndicator;
@synthesize view = _view;

#pragma mark - NSObject

- (void)dealloc
{
    [_viewBackground release];
    [_activityIndicator release];
    [_view release];
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)aRect
{
    self = [super init];
    if (self) {
		
        _view = [[UIView alloc] initWithFrame:aRect];
        [_view setBackgroundColor:[UIColor clearColor]];
        _viewBackground = [[UIView alloc] initWithFrame:self.view.frame];
        [_viewBackground setBackgroundColor:[UIColor blackColor]];
        [_viewBackground setAlpha:0.4];
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        CGRect newRect = _activityIndicator.frame;
        newRect.origin.x = (int)((aRect.size.width - _activityIndicator.frame.size.width) / 2);
        newRect.origin.y = (int)((aRect.size.height - _activityIndicator.frame.size.height) / 2);
        [_activityIndicator setFrame:newRect];
        [_activityIndicator setHidden:NO];
        [_activityIndicator startAnimating];
        
        [_view addSubview:_viewBackground];
        [_view addSubview:_activityIndicator];
	}
    return self;
}

#pragma mark - Singletion

+ (BOOL)initializeSingletonInstanceForWindow:(UIWindow*)window
{
    if (_instance == nil) {
		
        _instance = [[BMLoadingView alloc] initWithFrame:window.frame];
		
		if (_instance == nil) {
			return NO;
		} else {
			return YES;
		}
	} else {
		return YES;
	}
}

+ (BMLoadingView*)sharedInstance
{
	NSAssert(_instance != nil, @"You have to call initializeSingletonInstanceForWindow:window first!");
	
	return _instance;
}

+ (id)allocWithZone:(NSZone*)zone
{
    @synchronized(self) {
        if (_instance != nil) {
            return [_instance retain];
        } else {
            return [super allocWithZone:zone];
        }
    }
}

- (id)copyWithZone:(NSZone*)zone
{
	return self;
}

- (id)retain
{
	return self;
}

- (unsigned)retainCount
{
	return UINT_MAX;
}

- (oneway void)release
{
	//do nothing
}

- (id)autorelease
{
	return self;
}


@end
