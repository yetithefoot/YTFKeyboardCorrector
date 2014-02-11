//
//  YTFKeyboardCorrector.h
//  YTFKeyboardCorrector
//
//  Created by yeti on 25.09.12.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YTFKeyboardCorrector : NSObject {
	UIWindow* _window;
	UIView* _field;
}

+ (YTFKeyboardCorrector *) sharedInstance;

@property (nonatomic,retain) UIView* lastField;
@property (nonatomic,retain) UIWindow* window;

- (void) beginInput: (UIView*) field;
- (void) beginInput: (UIView*) field withOffset: (float) offset;
- (void) endInput;

@end
