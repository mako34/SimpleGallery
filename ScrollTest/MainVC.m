//
//  MainVC.m
//  ScrollTest
//
//  Created by  on 6/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainVC.h"

@implementation MainVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

 
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
     
    
     
    //Scroller
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height)];
    
    scroll.pagingEnabled = YES;
 
    
    int numberOfImages = 5;
    CGFloat currentX = 0.0f;
    
    
 
    
    for (int i=1; i <= numberOfImages; i++) {
        
        // create image
        NSString *imageName = [NSString stringWithFormat:@"%d.png", i];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        
        // put image on correct position
//        CGRect rect = imageView.frame;
        CGRect rect = self.view.frame;

        rect.origin.x = currentX;
        imageView.frame = rect;
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;

        
        // update currentX
        currentX += imageView.frame.size.width;
        
        [scroll addSubview:imageView];
        [imageView release];
    }
    
    


    
    
     scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfImages, self.view.frame.size.height);

    
    [self.view addSubview:scroll];
    [scroll release];
    
}
 

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
