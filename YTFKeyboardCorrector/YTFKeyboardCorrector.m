//
//  YTFKeyboardCorrector.m
//  YTFKeyboardCorrector
//
//  Created by yeti on 25.09.12.
//
//

#import "YTFKeyboardCorrector.h"

static const CGFloat PORTRAIT_KEYBOARD_HEIGHT_IPHONE = 264;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT_IPHONE = 352;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3f;

static YTFKeyboardCorrector* _instance;

@implementation YTFKeyboardCorrector

static float _animatedDistance;

@synthesize lastField = _field;
@synthesize window = _window;

+ (YTFKeyboardCorrector*) sharedInstance
{
	if(_instance == nil)
	{
		_instance = [[YTFKeyboardCorrector alloc] init];
	}
	return _instance;
}

- (void) dealloc
{
	[_window release];
	[_field release];
	[super dealloc];
}

- (void) beginInput: (UIView*) field;
{
  [self beginInput: field, withOffset: 0];
}

- (void)beginInput:(UIView*)field withOffset:(float)offset
{
  self.lastField = field;
  
  if(field == nil)
  {
    return;
  }
  
  float kbH = UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ?
  PORTRAIT_KEYBOARD_HEIGHT_IPHONE : LANDSCAPE_KEYBOARD_HEIGHT_IPHONE;
  
  CGRect textFieldRect = [self.window convertRect: field.bounds fromView: field];
  CGRect viewFrame = [[[self.window subviews] objectAtIndex: 0] frame];
  _animatedDistance = 0;
    
  switch ([UIApplication sharedApplication].statusBarOrientation)
  {
    case UIInterfaceOrientationPortrait:
      _animatedDistance = viewFrame.size.height - (textFieldRect.origin.y + textFieldRect.size.height - viewFrame.origin.y + kbH) - offset;
      if (_animatedDistance > 0) _animatedDistance = 0;
      viewFrame.origin.y += _animatedDistance;
      break;
    case UIInterfaceOrientationPortraitUpsideDown:
      _animatedDistance = viewFrame.size.height - (viewFrame.size.height - textFieldRect.origin.y + kbH) + offset;
      if (_animatedDistance > 0) _animatedDistance = 0;
      viewFrame.origin.y -= _animatedDistance;
      break;
    case UIInterfaceOrientationLandscapeLeft:
      _animatedDistance = viewFrame.size.width - (textFieldRect.origin.x + textFieldRect.size.width - viewFrame.origin.x + kbH) - offset;
      if (_animatedDistance > 0) _animatedDistance = 0;
      viewFrame.origin.x += _animatedDistance;
      break;
    case UIInterfaceOrientationLandscapeRight:
      _animatedDistance = viewFrame.size.width - (viewFrame.size.width - textFieldRect.origin.x  + kbH) - offset;
      if (_animatedDistance > 0) _animatedDistance = 0;
      viewFrame.origin.x -= _animatedDistance;
      break;
    default:
      break;
  }
  
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
  [[[self.window subviews] objectAtIndex: 0] setFrame: viewFrame];
  [UIView commitAnimations];
  
  
}

- (void) endInput
{
	if(self.lastField == nil)
	{
		return;
	}
	
	self.lastField = nil;
	
	
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration: KEYBOARD_ANIMATION_DURATION];
	CGRect viewFrame = [[[self.window subviews] objectAtIndex: 0] frame];
	switch ([UIApplication sharedApplication].statusBarOrientation)
	{
		case UIInterfaceOrientationPortrait:
			viewFrame.origin.y -= _animatedDistance;
			break;
		case UIInterfaceOrientationPortraitUpsideDown:
			viewFrame.origin.y += _animatedDistance;
			break;
		case UIInterfaceOrientationLandscapeLeft:
			viewFrame.origin.x -= _animatedDistance;
			break;
		case UIInterfaceOrientationLandscapeRight:
			viewFrame.origin.x += _animatedDistance;
			break;
		default:
			break;
	}
	
	[[[self.window subviews] objectAtIndex: 0] setFrame: viewFrame];
    [UIView commitAnimations];
}


@end

