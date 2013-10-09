//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Jaayden on 10/8/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

- (void)updateTemperature;
- (float)fahrenheitFromCelsius:(float)celsius;
- (float)celsiusFromFahrenheit:(float)fahrenheit;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.celsiusTextField.delegate = self;
    self.fahrenheitTextField.delegate = self;
    
    [self.convertButton addTarget:self action:@selector(updateTemperature) forControlEvents:UIControlEventTouchDown];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    self.celsiusTextField.text = nil;
    self.fahrenheitTextField.text = nil;
    
    return YES;
}

#pragma mark - private methods

- (void) onDoneButton {
    [self.view endEditing:YES];
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)updateTemperature {
    
    if (self.celsiusTextField.hasText) {
        float celsius = [self.celsiusTextField.text floatValue];
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.1f °F", [self fahrenheitFromCelsius:celsius]];
    } else if (self.fahrenheitTextField.hasText) {
        float fahrenheit = [self.fahrenheitTextField.text floatValue];
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.1f °C", [self celsiusFromFahrenheit:fahrenheit]];
    }
}

- (float)fahrenheitFromCelsius:(float)celsius {
    return celsius * 9/5 + 32;
}

- (float)celsiusFromFahrenheit:(float)fahrenheit {
    return (fahrenheit - 32) * 5/9;
}

@end
