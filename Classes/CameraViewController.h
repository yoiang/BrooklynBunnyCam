//
//  CameraViewController.h
//
//  Created by Ian on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CameraViewController : UIViewController {
	NSString* _url;
	NSMutableData* _receivedData;
	UIActivityIndicatorView* activity;
	NSTimer* _updateCameraTimer;
}

@property ( nonatomic, retain ) IBOutlet UIActivityIndicatorView* activity;
- ( BOOL )startDownloading;
- ( void )setUpdateRate:( float )seconds;

@end
