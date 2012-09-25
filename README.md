YTFKeyboardCorrector
====================

Keyboard Corrector for input fields in iOS.


<img src="https://raw.github.com/yetithefoot/YTFKeyboardCorrector/master/raw/1.png" alt="Image1" title="YTFKeyboardCorrector" style="width:320px!important; display:inline; margin: 10px auto 30px auto;"/>
<img src="https://raw.github.com/yetithefoot/YTFKeyboardCorrector/master/raw/2.png" alt="Imagew" title="YTFKeyboardCorrector" style="width:320px!important; display:inline; margin: 10px auto 30px auto;"/>
<img src="https://raw.github.com/yetithefoot/YTFKeyboardCorrector/master/raw/3.png" alt="Imagee" title="YTFKeyboardCorrector" style="width:320px!important; display:inline; margin: 10px auto 30px auto;"/>
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