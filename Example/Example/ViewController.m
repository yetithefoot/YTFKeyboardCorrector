//
//  ViewController.m
//  Example
//
//  Created by yeti on 25.09.12.
//
//

#import "ViewController.h"



@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    // add delegate to textfields
    for (UIView * subview in self.view.subviews) {
        if([subview isKindOfClass:[UITextField class]]){
            ((UITextField *)subview).delegate = self;
        }
    }
    
}


-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    
    [[YTFKeyboardCorrector sharedInstance] beginInput: textField];

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    

    [[YTFKeyboardCorrector sharedInstance] endInput];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // hide keyboard
    for (UIView * subview in self.view.subviews) {
        if([subview isKindOfClass:[UITextField class]]){
            [subview resignFirstResponder];
        }
    }

}


@end
