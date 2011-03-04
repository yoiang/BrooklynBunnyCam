//
//  Brooklyn_Bunny_CamViewController.h
//  Brooklyn Bunny Cam
//
//  Created by Ian on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraViewController;

@interface Brooklyn_Bunny_CamViewController : UIViewController {
	CameraViewController* cameraOneController;
	CameraViewController* cameraTwoController;
	
	UIView* infoView;
	UIViewController* infoViewController;
	UISlider* updateRate;
}

@property ( nonatomic, retain ) IBOutlet CameraViewController* cameraOneController;
@property ( nonatomic, retain ) IBOutlet CameraViewController* cameraTwoController;
@property ( nonatomic, retain ) IBOutlet UIView* infoView;
@property ( nonatomic, retain ) IBOutlet UIViewController* infoViewController;
@property ( nonatomic, retain ) IBOutlet UISlider* updateRate;

-( IBAction )infoButtonTouched;
-( IBAction )infoClosedButtonTouched;

@end

