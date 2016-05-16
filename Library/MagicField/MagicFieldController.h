//
//  MagicFieldController.h
//  MagicField
//
//  Created by Pau on 16/05/2016.
//  Copyright © 2016 Pablo Alejandro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MagicFieldDelegate <NSObject>

@optional

- (void)magicFieldDidBeginEditing:(UITextField *)textField;
- (void)magicFieldDidEndEditing:(UITextField *)textField;
- (void)magicFieldDidChangeText:(NSString *)text;
- (void)magicFieldDidPressReturn:(UITextField *)textField;
- (void)magicFieldDidPressClear;

@end

@interface MagicFieldController : UIViewController

// Delegate
@property (nonatomic) id <MagicFieldDelegate> delegate;

// Colors
@property (nonatomic, strong) UIColor * backgroundColor;
@property (nonatomic, strong) UIColor * titleColor;
@property (nonatomic, strong) UIColor * textColor;
@property (nonatomic, strong) UIColor * placeHolderColor;

// Fonts
@property (nonatomic, strong) UIFont * titleFont;
@property (nonatomic, strong) UIFont * textFont;
@property (nonatomic, strong) UIFont * placeHolderFont;

// Texts
@property (nonatomic, strong) NSString * titleString;
@property (nonatomic, strong) NSString * textString;
@property (nonatomic, strong) NSString * placeHolderString;

// Image
@property (nonatomic, strong) UIImage * image;

// Other properties
@property (nonatomic) BOOL enabled;
@property (nonatomic) BOOL dismissWhenSearch;

- (void)dismissKeyboard;

@end
