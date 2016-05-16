//
//  MagicFieldView.m
//  MagicField
//
//  Created by Pau on 16/05/2016.
//  Copyright © 2016 Pablo Alejandro. All rights reserved.
//

#import "MagicFieldView.h"

@interface MagicFieldView ()

@end

@implementation MagicFieldView

#pragma mark - Programmatically initialisation

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self setupFromCode];
    }
    return self;
}

#pragma mark - Private methods

- (void)setupFromCode
{
    self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.5f];
    
    // Imageview initialisation
    _imageView = [[UIImageView alloc] initWithFrame:CGRectNull];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.contentMode = UIViewContentModeCenter;

    // Title label initialisation
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectNull];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.alpha = 0;
    
    // Text field initialisation
    _textField = [[UITextField alloc] initWithFrame:CGRectNull];
    _textField.translatesAutoresizingMaskIntoConstraints = NO;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;

    // Add subviews
    [self addSubview:_imageView];
    [self addSubview:_titleLabel];
    [self addSubview:_textField];

    // Image
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:-20]];
    
    // Title label
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleLabel
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_textField
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleLabel
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:-10]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_textField
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    // Text field
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textField
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_imageView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:10]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textField
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:-10]];
    
    _textFieldVerticalConstraint = [NSLayoutConstraint
                                        constraintWithItem:_textField
                                        attribute:NSLayoutAttributeCenterY
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                        attribute:NSLayoutAttributeCenterY
                                        multiplier:1
                                        constant:0];
    
    [self addConstraint:_textFieldVerticalConstraint];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
