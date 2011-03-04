//
//  CameraViewController.m
//
//  Created by Ian on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController

@synthesize activity;

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
	 [ super viewDidLoad ];
	 
	 [ self setUpdateRate:30 ];
	 _url = [ [ NSString alloc ] initWithString:[ self title ] ];
	 
	 _receivedData = nil;

	 if ( !( [ [ self view ] isKindOfClass:[ UIImageView class ] ] ) )
		 @throw( [ NSException exceptionWithName:@"CameraViewController not given a UIImageView" reason:@"view is not of proper type"
										userInfo:nil 
				  ] );
	 
	 [ self startDownloading ];
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
    [ super dealloc ];
	[ _url release ];
}


- ( BOOL )startDownloading
{
    NSURLRequest* urlRequest = [ NSURLRequest requestWithURL:[ NSURL URLWithString:_url ]
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
											  timeoutInterval:60.0 ];
	
	NSURLConnection *urlConnection = [ [ NSURLConnection alloc ] initWithRequest:urlRequest delegate:self ];
	if ( urlConnection ) {
		_receivedData = [ [ NSMutableData data ] retain];
		[ activity startAnimating ];
		return TRUE;
    }
	return FALSE;
}

- ( void )connection:( NSURLConnection* )connection didReceiveResponse:( NSURLResponse* )response
{
    [ _receivedData setLength:0 ];
}

- ( void )connection:( NSURLConnection* )connection didReceiveData:( NSData* )data
{
    [ _receivedData appendData:data ];
}

- ( void )connection:( NSURLConnection* )connection
  didFailWithError:( NSError* )error
{
	[ activity stopAnimating ];
	
    [ connection release ];
    [ _receivedData release ];
	
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- ( void )connectionDidFinishLoading:( NSURLConnection* )connection
{
	[ activity stopAnimating ];
	
	UIImage* image = [ UIImage imageWithData:_receivedData ];
	UIImageView* imageView = ( UIImageView* )[ self view ];
	[ imageView setImage:image ];	
	
    [ connection release ];
    [ _receivedData release ];
	_receivedData = nil;
}

-( void )setUpdateRate:( float )seconds
{
	if ( _updateCameraTimer != nil )
	{
		[ _updateCameraTimer invalidate ];
		_updateCameraTimer = nil;
	}
	_updateCameraTimer = [ NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector( startDownloading ) userInfo:nil repeats:YES ];
}

@end
