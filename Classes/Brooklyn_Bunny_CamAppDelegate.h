//
//  Brooklyn_Bunny_CamAppDelegate.h
//  Brooklyn Bunny Cam
//
//  Created by Ian on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Brooklyn_Bunny_CamViewController;

@interface Brooklyn_Bunny_CamAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Brooklyn_Bunny_CamViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Brooklyn_Bunny_CamViewController *viewController;

@end

