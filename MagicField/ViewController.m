//
//  ViewController.m
//  MagicField
//
//  Created by Pau on 16/05/2016.
//  Copyright © 2016 Pablo Alejandro. All rights reserved.
//

#import "ViewController.h"
#import "MagicFieldController.h"

@interface ViewController () <MagicFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MagicFieldDelegate

- (void)magicFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%s", __func__);
}

- (void)magicFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%s", __func__);
}

- (void)magicFieldDidChangeText:(NSString *)text
{
    NSLog(@"%s %@", __func__, text);
}

- (void)magicFieldDidPressReturn:(UITextField *)textField
{
    NSLog(@"%s", __func__);
}

- (void)magicFieldDidPressClear
{
    NSLog(@"%s", __func__);
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"MagicFieldSegue"]) {
        if([[segue destinationViewController] isKindOfClass:[MagicFieldController class]]) {
            
            MagicFieldController * magicFieldController = [segue destinationViewController];
            
            magicFieldController.delegate = self;
            
            magicFieldController.enabled = YES;
            magicFieldController.dismissWhenSearch = YES;
            
            magicFieldController.image = [UIImage imageNamed:@"image"];
            
            magicFieldController.titleString = @"TITLE";
            magicFieldController.textString = nil;
            magicFieldController.placeHolderString = @"Placeholder...";
            
//            magicFieldController.backgroundColor = [UIColor ...];
//            magicFieldController.titleColor = [UIColor ...];
//            magicFieldController.textColor = [UIColor ...];
//            magicFieldController.placeHolderColor = [UIColor ...];
            
            //    magicFieldController.titleFont = [UIFont ...];
            //    magicFieldController.textFont = [UIColor ...];
            //    magicFieldController.placeHolderFont = [UIColor ...];
        }
    }
}

@end
