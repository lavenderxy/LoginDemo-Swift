//
//protocol PasswordTextFieldDelegate {
//  func sumbitPassword()
//}

import UIKit


class PasswordTextField:UITextField {
//  var delegate:PasswordTextFieldDelegate?

  
  override func drawTextInRect(rect: CGRect) {
    super.drawTextInRect(rect)

    translatesAutoresizingMaskIntoConstraints = false
    borderStyle = .None
    userInteractionEnabled = true
    clearsOnBeginEditing = true
    textColor = colorGrey()
    
    delegate = self

  }
}

extension PasswordTextField:UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(textField:UITextField) -> Bool {
    secureTextEntry = true
    return true
  }
  
  func textFieldDidBeginEditing(textField:UITextField) {
  }
  
  func textFieldShouldEndEditing(textField:UITextField) -> Bool {
    return true
  }
  
  func textFieldDidEndEditing(textField:UITextField) {
  }
  
  func textField(textField:UITextField, shouldChangeCharactersInRange range:NSRange, replacementString:String) -> Bool{    print(#function, #line)
    return true
  }
  
  func textFieldShouldClear(textField:UITextField) -> Bool {
    return true
  }
  
  func textFieldShouldReturn(textField:UITextField) -> Bool {
    return true
  }
  
}
