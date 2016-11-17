//
//  ViewController.m
//  test
//
//  Created by Garrett Wang on 10/31/16.
//  Copyright © 2016 Garrett Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel
;
@end

@implementation ViewController
- (IBAction)didTabButton:(id)sender {
    NSString *first = _firstNameField.text;
    NSString *last = _lastNameField.text;
    NSString *yearTick = [self classTickFromYear:_yearField.text];
    NSString *outputString = [NSString stringWithFormat:@"%@ %@ %@", first, last, yearTick];
//    NSLog(@"%@ %@ %@", first, last, yearTick);
    _outputLabel.text = outputString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)classTickFromYear:(NSString *)year {
    return [NSString stringWithFormat:@"'%@", [year substringFromIndex:2]];
}
@end
