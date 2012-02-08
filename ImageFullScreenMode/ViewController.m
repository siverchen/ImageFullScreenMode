//
//  ViewController.m
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Image.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    imageScreenShow = NO;
    UIImage *image = [UIImage imageNamed:@"Apple_Store_Ginza_by_Atreide.png"];
    
    Image *trueImage = [[Image alloc] init];
    trueImage.imgdata = UIImageJPEGRepresentation(image, 1);
    
    Thumbnails *imageview = [[Thumbnails alloc] initWithTHImage:trueImage];
    [imageview setDelegate:self];
    [imageview setFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:imageview];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (!imageScreenShow)
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    else
        return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}


- (void)TouchBegan:(Thumbnails *)thumbnail{
    imageScreen = [[ImageFullScreen alloc] init];
    [imageScreen setDelegate:self];
    [imageScreen setFSImage:thumbnail];
    [imageScreen ToFullScreenFrom:[thumbnail frame] Target:self.view];
    [self.view addSubview:imageScreen.view];
}
- (void)FullScreenDidDisappear{
    imageScreenShow = NO;
    UIApplication* application = [UIApplication sharedApplication];
    
    if (application.statusBarOrientation != UIInterfaceOrientationPortrait)
    {
        UIViewController *c = [[UIViewController alloc]init];
        [self presentModalViewController:c animated:NO];
        [self dismissModalViewControllerAnimated:NO];
        [c release];
    }
}

- (void)FullScreenDidAppear{
    imageScreenShow = YES;
    UIViewController *c = [[UIViewController alloc]init];
    [self presentModalViewController:c animated:NO];
    [self dismissModalViewControllerAnimated:NO];
    [c release];
}

@end
