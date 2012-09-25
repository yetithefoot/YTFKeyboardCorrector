YTFKeyboardCorrector
====================

Keyboard Corrector for input fields in iOS.

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