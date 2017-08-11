//
//  TPKeyboardAvoidingScrollView.h
//
//  Created by Michael Tyson on 30/09/2013.
//  Copyright 2013 A Tasty Pixel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+TPKeyboardAvoidingAdditions.h"

@protocol AvoidingKeyBoardDelegate <NSObject>

-(void)touchBegin;
-(void)keyBoardReturn:(UITextField *)textField;
-(BOOL)keyBoardShouldBegingEditing:(UITextField *)textField;
-(BOOL)textField:(UITextField *)textField shouldReplaceString:(NSString *)string;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
@end


@interface TPKeyboardAvoidingScrollView : UIScrollView <UITextFieldDelegate, UITextViewDelegate>


@property(nonatomic,weak)id<AvoidingKeyBoardDelegate> Delegate;

- (void)contentSizeToFit;
- (BOOL)focusNextTextField;
- (void)scrollToActiveTextField;


@end
