//
//  ViewController.m
//  Mandelbrot
//
//  Created by neodevelop on 04/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Fractal.h"
#import "Dragon.h"

@implementation ViewController

@synthesize fractal = _fractal;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _fractal = [[Fractal alloc] initWithFrame:self.view.frame];
    //Dragon * dragon = [[Dragon alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_fractal];
    //[self.view addSubview:dragon];
    NSLog(@"Cargado");
    UIPinchGestureRecognizer * pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHappened:)];
    [_fractal addGestureRecognizer:pinchGesture];
}

-(void)pinchHappened:(UIPinchGestureRecognizer *)recognizer{
    _fractal.transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
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
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
