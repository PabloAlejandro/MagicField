//
//  MagicFieldView.h
//  MagicField
//
//  Created by Pau on 16/05/2016.
//  Copyright © 2016 Pablo Alejandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagicFieldView : UIView

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) NSLayoutConstraint * textFieldVerticalConstraint;

@end
