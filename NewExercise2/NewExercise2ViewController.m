//
//  NewExercise2ViewController.m
//  NewExercise2
//
//  Created by Gabriel Aliotta on 2/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "NewExercise2ViewController.h"

@implementation NewExercise2ViewController
@synthesize leakingString = _leakingString;

- (void)dealloc
{
    [_leakingString release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    _leakingString = [[NSString alloc] initWithUTF8String:"leaking once"];
    // Se crea un objeto (digamos que su id es 1) y su counter queda en 1 y queda asignado a leakingString
	self.leakingString = [[NSString alloc] initWithUTF8String:"leaking twice"];
    // Se crea un objeto (digamos que su id es 2) y su counter queda en 1 y queda asignado a leakingString 
    // El objeto con id 1 queda haciendo un leak
	self.leakingString = [[NSString alloc] initWithUTF8String:"leaking all the time"];    
    // Se crea un objeto (digamos que su id es 3) y su counter queda en 1 y queda asignado a leakingString 
    // El objeto con id 2 queda haciendo un leak
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.leakingString = nil;
    //
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
