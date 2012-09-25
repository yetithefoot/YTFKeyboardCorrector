YTFKeyboardCorrector
====================

Keyboard Corrector for input fields in iOS.


<img src="https://raw.github.com/yetithefoot/YTFKeyboardCorrector/master/raw/1-2-3.png" alt="Screenshots" title="YTFKeyboardCorrector" style="display:inline; margin: 10px auto 30px auto;">

Init
----

In your **appDelegate** add next line to **didFinishLaunchingWithOptions** method.

	[InputManager sharedInstance].window = window;



Usage
-----

In your code:

	-(void) textFieldDidBeginEditing:(UITextField *)textField{

		[[InputManager sharedInstance] beginInput: textField];
		// your code here
	}

and

	(void)textFieldDidEndEditing:(UITextField *)textField{

		// your code here
		[[InputManager sharedInstance] endInput];
	}