//
//  Brooklyn_Bunny_CamViewController.m
//  Brooklyn Bunny Cam
//
//  Created by Ian on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Brooklyn_Bunny_CamViewController.h"
#import "CameraViewController.h"

@implementation Brooklyn_Bunny_CamViewController

@synthesize cameraOneController;
@synthesize cameraTwoController;
@synthesize infoView;
@synthesize infoViewController;
@synthesize updateRate;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES; //(interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

-( IBAction )infoButtonTouched
{
	infoViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[ self presentModalViewController:infoViewController animated:YES ];
}

-( IBAction )infoClosedButtonTouched
{
	float updateUpdateRate = [ updateRate value ];
	[ cameraOneController setUpdateRate:updateUpdateRate ];
	[ cameraTwoController setUpdateRate:updateUpdateRate ];
	[ infoViewController dismissModalViewControllerAnimated:YES ];
}

@end
