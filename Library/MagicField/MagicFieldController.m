//
//  MagicFieldController.m
//  MagicField
//
//  Created by Pau on 16/05/2016.
//  Copyright © 2016 Pablo Alejandro. All rights reserved.
//

#import "MagicFieldController.h"
#import "MagicFieldView.h"

@interface MagicFieldController () <UITextFieldDelegate>

@property (nonatomic, strong) MagicFieldView * magicFieldView;

@end

@implementation MagicFieldController

@synthesize backgroundColor = _backgroundColor;
@synthesize titleColor = _titleColor;
@synthesize textColor = _textColor;
@synthesize placeHolderColor = _placeHolderColor;

@synthesize titleFont = _titleFont;
@synthesize textFont = _textFont;
@synthesize placeHolderFont = _placeHolderFont;

@synthesize titleString = _titleString;
@synthesize textString = _textString;
@synthesize placeHolderString = _placeHolderString;

#pragma mark - Public methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupMagicField];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - Private methods

- (void)setupMagicField
{
    self.enabled = YES;
    
    [self.view addSubview:self.magicFieldView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.magicFieldView
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.magicFieldView
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.magicFieldView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.magicFieldView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
}

#pragma mark - Public methods

- (void)dismissKeyboard
{
    if([self.magicFieldView.textField.text length]) {
    
        [self.magicFieldView.textField resignFirstResponder];
    }
    else {
    
        [self.magicFieldView layoutIfNeeded];
        
        [UIView animateWithDuration:.35f animations:^{
            
            [self.magicFieldView.textField resignFirstResponder];
            
            self.magicFieldView.titleLabel.alpha = 0;
            
            self.magicFieldView.textFieldVerticalConstraint.constant = 0;
            
            [self.magicFieldView layoutIfNeeded];
        }];
    }
}

#pragma mark - Getters

- (MagicFieldView *)magicFieldView
{
    if(!_magicFieldView) {
        _magicFieldView = [[MagicFieldView alloc] initWithFrame:CGRectNull];
        _magicFieldView.translatesAutoresizingMaskIntoConstraints = NO;
        
        _magicFieldView.textField.delegate = self;
        
        _magicFieldView.backgroundColor = self.backgroundColor;
        
        _magicFieldView.titleLabel.textColor = self.titleColor;
        _magicFieldView.textField.textColor = self.textColor;
        
        if ([_magicFieldView.textField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
            NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:_magicFieldView.textField.attributedPlaceholder];
            [attrStr addAttributes:@{NSForegroundColorAttributeName: self.placeHolderColor, NSFontAttributeName: self.placeHolderFont} range:NSMakeRange(0, attrStr.length)];
            _magicFieldView.textField.attributedPlaceholder = attrStr;
        }
        
        _magicFieldView.titleLabel.font = self.titleFont;
        _magicFieldView.textField.font = self.textFont;
        
        _magicFieldView.titleLabel.text = self.titleString;
        _magicFieldView.textField.text = self.textString;
        _magicFieldView.textField.placeholder = self.placeHolderString;
        
        _magicFieldView.imageView.image = self.image;
    }
    return _magicFieldView;
}

- (UIColor *)titleColor
{
    if(!_titleColor) {
        _titleColor = [UIColor blackColor];
    }
    return _titleColor;
}

- (UIColor *)textColor
{
    if(!_textColor) {
        _textColor = [UIColor blackColor];
    }
    return _textColor;
}

- (UIColor *)placeHolderColor
{
    if(!_placeHolderColor) {
        _placeHolderColor = [UIColor grayColor];
    }
    return _placeHolderColor;
}

- (UIFont *)titleFont
{
    if(!_titleFont) {
        _titleFont = [UIFont systemFontOfSize:10];
    }
    return _titleFont;
}

- (UIFont *)textFont
{
    if(!_textFont) {
        _textFont = [UIFont boldSystemFontOfSize:14];
    }
    return _textFont;
}

- (UIFont *)placeHolderFont
{
    if(!_placeHolderFont) {
        _placeHolderFont = [UIFont systemFontOfSize:14];
    }
    return _placeHolderFont;
}

#pragma mark - Setters

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    
    self.magicFieldView.backgroundColor = backgroundColor;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    
    self.magicFieldView.titleLabel.textColor = titleColor;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    
    self.magicFieldView.textField.textColor = textColor;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor
{
    _placeHolderColor = placeHolderColor;
    
    if ([_magicFieldView.textField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:_magicFieldView.textField.attributedPlaceholder];
        [attrStr addAttributes:@{NSForegroundColorAttributeName: self.placeHolderColor, NSFontAttributeName: self.placeHolderFont} range:NSMakeRange(0, attrStr.length)];
        _magicFieldView.textField.attributedPlaceholder = attrStr;
    }
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    
    self.magicFieldView.titleLabel.font = titleFont;
}

- (void)setTextFont:(UIFont *)textFont
{
    _textFont = textFont;
    
    self.magicFieldView.textField.font = textFont;
}

- (void)setPlaceHolderFont:(UIFont *)placeHolderFont
{
    _placeHolderFont = placeHolderFont;
    
    if ([_magicFieldView.textField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:_magicFieldView.textField.attributedPlaceholder];
        [attrStr addAttributes:@{NSForegroundColorAttributeName: self.placeHolderColor, NSFontAttributeName: self.placeHolderFont} range:NSMakeRange(0, attrStr.length)];
        _magicFieldView.textField.attributedPlaceholder = attrStr;
    }
}

- (void)setTitleString:(NSString *)titleString
{
    _titleString = titleString;
    
    self.magicFieldView.titleLabel.text = titleString;
}

- (void)setTextString:(NSString *)textString
{
    _textString = textString;
    
    self.magicFieldView.textField.text = textString;
    
    if([textString length]) {
        
        [self.magicFieldView layoutIfNeeded];
        
        [UIView animateWithDuration:.35f animations:^{
            
            self.magicFieldView.titleLabel.alpha = 1;
            
            self.magicFieldView.textFieldVerticalConstraint.constant = CGRectGetHeight(self.magicFieldView.frame) * 0.1f;
            
            [self.magicFieldView layoutIfNeeded];
        }];
    }
    else {
    
        if(self.enabled) {
            
            [self.magicFieldView layoutIfNeeded];
            
            [UIView animateWithDuration:.35f animations:^{
                
                self.magicFieldView.titleLabel.alpha = 0;
                
                self.magicFieldView.textFieldVerticalConstraint.constant = 0;
                
                [self.magicFieldView layoutIfNeeded];
            }];
        }
    }
}

- (void)setPlaceHolderString:(NSString *)placeHolderString
{
    _placeHolderString = placeHolderString;
    
    self.magicFieldView.textField.placeholder = placeHolderString;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(self.enabled) {
    
        [self.magicFieldView layoutIfNeeded];
        
        [UIView animateWithDuration:.35f animations:^{
            
            self.magicFieldView.titleLabel.alpha = 1;
            
            self.magicFieldView.textFieldVerticalConstraint.constant = CGRectGetHeight(self.magicFieldView.frame) * 0.1f;
            
            [self.magicFieldView layoutIfNeeded];
        }];
    }
    
    return self.enabled;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([self.delegate respondsToSelector:@selector(magicFieldDidBeginEditing:)]) {
        [self.delegate magicFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if([self.delegate respondsToSelector:@selector(magicFieldDidEndEditing:)]) {
        [self.delegate magicFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([self.delegate respondsToSelector:@selector(magicFieldDidChangeText:)]) {
        [self.delegate magicFieldDidChangeText:[textField.text stringByAppendingString:string]];
    }
    
    return YES;
}


- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if([self.delegate respondsToSelector:@selector(magicFieldDidPressClear)]) {
        [self.delegate magicFieldDidPressClear];
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(self.dismissWhenSearch) {
        [self dismissKeyboard];
    }
    
    if([self.delegate respondsToSelector:@selector(magicFieldDidPressReturn:)]) {
        [self.delegate magicFieldDidPressReturn:textField];
    }
    
    return YES;
}

@end
