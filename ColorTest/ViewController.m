//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *colorView;
@property (strong, nonatomic) IBOutlet UISlider *red;
@property (strong, nonatomic) IBOutlet UISlider *green;
@property (strong, nonatomic) IBOutlet UISlider *blue;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indi1;
- (IBAction)rgbPicker:(id)sender;

@end

@implementation ViewController

- (IBAction)rgbPicker:(UISlider *)sender {
    if([self.indi1 isAnimating]){
        [self.indi1 stopAnimating];
    }
    self.colorView.backgroundColor = [UIColor colorWithRed:self.red.value green:self.green.value blue:self.blue.value alpha:1.0];
    
}
- (IBAction)onOffSwitch:(UISwitch *)sender {
    BOOL isOn = sender.on;
    
    self.red.enabled =isOn;
    self.green.enabled =isOn;
    self.blue.enabled =isOn;
    
    if(isOn){
        [self.indi1 startAnimating];
        [self performSelector:@selector(rgbPicker:) withObject:nil afterDelay:1.0];
    }
    else{
        self.colorView.backgroundColor = [ UIColor grayColor];
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    [self rgbPicker:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
