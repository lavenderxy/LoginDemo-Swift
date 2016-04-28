import UIKit

class LoginView:UIView {
  var emailTF:UITextField!
  var passwordTF:UITextField!
//  var rememberMeBTN:UIButton!
  let checkedImage = UIImage(named:"checked")
  let uncheckedImage = UIImage(named:"unchecked")
  let touchID = UIImage(named:"touchID")

  let rememberMeBTN = UIButton()
  let goBTN = UIButton()
  let forgetPwBTN = UIButton()
  let touchBTN = UIButton()
    
  var isChecked:Bool = NSUserDefaults.standardUserDefaults().boolForKey("isChecked")
  let MyKeychainWrapper = KeychainWrapper()
    

  required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
  
  override init(frame:CGRect) {
    super.init(frame: frame)
    
    backgroundColor = colorWhite()
    
    
    let descriptionText = "Cockatoo is the quickest way to get help during emergencies.  It is your Twitter resource for safeguarding your health and safety during health incidents or any urgent situations that may arise.  Use Cockatoo to register guests and visitors or connect with closest security department official."
    
    
    let description = UILabel()
    description.numberOfLines = 7
    description.font = UIFont(name: description.font.fontName, size: 14)
    description.textAlignment = .Justified
    description.text = descriptionText
    description.translatesAutoresizingMaskIntoConstraints = false
    description.setContentHuggingPriority(10, forAxis: .Horizontal)
    description.textColor = colorGrey()
    
    
    
    emailTF = PasswordTextField()
    emailTF.placeholder = "Email"
    emailTF.textAlignment = .Center
    
    
    passwordTF = PasswordTextField()
    passwordTF.text = "Password"
    passwordTF.secureTextEntry = true
    passwordTF.textAlignment = .Center
    
    if isChecked == true {
        emailTF.text = NSUserDefaults.standardUserDefaults().valueForKey("userName") as? String
        passwordTF.text = MyKeychainWrapper.myObjectForKey("v_Data") as? String
    }
    
    //add check box
    rememberMeBTN.frame.size = CGSizeMake(10, 10);
    rememberMeBTN.setImage(uncheckedImage, forState: .Highlighted)
    if isChecked == true {
        rememberMeBTN.setImage(checkedImage, forState: .Normal)
    }else{
        rememberMeBTN.setImage(uncheckedImage, forState: .Normal)
        
    }
//    rememberMeBTN.setImage(uncheckedImage, forState: .Normal)
    rememberMeBTN.addTarget(self, action: #selector(LoginView.clickCheckBTN(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    
    
    let saveLabel = UILabel()
    saveLabel.text = "Save Login Information"
    saveLabel.textColor = colorTwitter()
    saveLabel.font =  saveLabel.font.fontWithSize(14)
    saveLabel.textAlignment = NSTextAlignment.Left
    
    
    forgetPwBTN.setTitle("Forgot Username/Forgot Password",forState:.Normal)
    forgetPwBTN.setTitleColor(colorTwitter(), forState: .Normal)
    forgetPwBTN.titleLabel!.font = UIFont(name:"Helvetica Neue",size: 14)
    
    touchBTN.setImage(touchID, forState: .Normal)
    
    
//    let labelRememberMe = UILabel()
//    labelRememberMe.text = "Remember Me"
//    labelRememberMe.setContentHuggingPriority(10,forAxis:.Horizontal)
    
//    objText   = "Remember Me"
//    objAction = #selector(didTapRememberMeButton)
//    let buttonRememberMe:UIButton = UIButton()
//    buttonRememberMe.translatesAutoresizingMaskIntoConstraints = false
//    buttonRememberMe.setTitle(objText, forState:.Normal)
//    buttonRememberMe.backgroundColor = colorTwitter()
//    buttonRememberMe.selected = false
//    buttonRememberMe.setContentHuggingPriority(5,forAxis:.Horizontal)
//    buttonRememberMe.addTarget(self, action:objAction!, forControlEvents: UIControlEvents.TouchUpInside)
    
//    objText   = "\u{2610}"
//    objAction = #selector(didTapRememberMeButton)
//    buttonRememberMeBox = UIButton()
//    buttonRememberMeBox.translatesAutoresizingMaskIntoConstraints = false
//    buttonRememberMeBox.setTitle(objText, forState:.Normal)
//    buttonRememberMeBox.setTitle("\u{2611}", forState:.Selected)
//    buttonRememberMeBox.backgroundColor = colorTwitter()
//    buttonRememberMeBox.selected = false
//    buttonRememberMeBox.setContentHuggingPriority(1,forAxis:.Horizontal)
//    buttonRememberMeBox.addTarget(self, action:objAction!, forControlEvents: UIControlEvents.TouchUpInside)
    
//    let stackRememberMe = UIStackView()
//    stackRememberMe.translatesAutoresizingMaskIntoConstraints = false
//    stackRememberMe.axis = .Horizontal
//    stackRememberMe.spacing = spacing
//    stackRememberMe.alignment = .Fill
//    stackRememberMe.distribution = .Fill

//    stackRememberMe.addArrangedSubview(labelRememberMe)
//    stackRememberMe.addArrangedSubview(buttonRememberMe)
//    stackRememberMe.addArrangedSubview(buttonRememberMeBox)

    goBTN.setTitle("Login", forState:.Normal)
    goBTN.translatesAutoresizingMaskIntoConstraints = false
    goBTN.setTitleColor(UIColor.whiteColor(), forState:.Normal)
    goBTN.backgroundColor = colorTwitter()
    goBTN.layer.shadowOffset = CGSizeMake(5.0, 5.0)
    goBTN.layer.shadowOpacity = 0.3
    goBTN.layer.shadowRadius = 5.0
    goBTN.layer.shadowColor = colorGrey().CGColor
//    goBTN.addTarget(self, action:#selector(LoginController.didTapGoBTN), forControlEvents: UIControlEvents.TouchUpInside)
    goBTN.addTarget(self, action: #selector(LoginView.clickLoginBTN(_:)), forControlEvents: UIControlEvents.TouchUpInside)

    
    let stackTextFields = UIStackView()
    stackTextFields.translatesAutoresizingMaskIntoConstraints = false
    stackTextFields.axis = .Vertical
    stackTextFields.spacing = 15
    stackTextFields.alignment = .Center
    stackTextFields.distribution = .Fill
    
    let line1 = lineHorizontal()
    let line2 = lineHorizontal()
    
    stackTextFields.addArrangedSubview(emailTF)
    stackTextFields.addArrangedSubview(line1)
    stackTextFields.addArrangedSubview(passwordTF)
    stackTextFields.addArrangedSubview(line2)
    
    let stackSaveInfo = UIStackView()
    stackSaveInfo.distribution = .Fill
    stackSaveInfo.axis = .Horizontal
    stackSaveInfo.spacing = 10
    stackSaveInfo.addArrangedSubview(rememberMeBTN)
    stackSaveInfo.addArrangedSubview(saveLabel)
    
    let stackForgetPw = UIStackView()
    stackForgetPw.distribution = .Fill
    stackForgetPw.axis = .Vertical
//    stackForgetPw.spacing = 40
    stackForgetPw.addArrangedSubview(touchBTN)
    stackForgetPw.addArrangedSubview(forgetPwBTN)
    
    
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .Vertical
    stack.alignment = .Center
    stack.distribution = .EqualSpacing
    
    
    stack.addArrangedSubview(description)
    stack.addArrangedSubview(stackTextFields)
    //    stack.addArrangedSubview(stackRememberMe)
//    stack.addArrangedSubview(rememberMeBTN)
    stack.addArrangedSubview(stackSaveInfo)
//    stack.addArrangedSubview(saveLabel)
    stack.addArrangedSubview(goBTN)
    stack.addArrangedSubview(stackForgetPw)
    
    addSubview(stack)
//    addSubview(forgetPwBTN)
    
    Bind(restrict: stack, authority:self)
      .centerXs
      .tops.staticOffset(40)
      .heights.relativeOffset(0.9)
      .__
    
    Bind(restrict: description, authority:self)
      .widths.relativeOffset(0.80)
      .__
    
    
    Bind(restrict: goBTN, authority:self)
      .widths.relativeOffset(0.6)
      .heights.relativeOffset(0.1)
      .__


    
    Bind(restrict: saveLabel, authority: self)
      .centerXs.staticOffset(20)
      .__

    
    for line in [emailTF, line1, passwordTF, line2] {
      Bind(restrict: line, authority:self)
        .widths.relativeOffset(0.92)
        .__
    }
    
    
    
    
////      .widths.relativeOffset(0.87).__
//    
//    
//    Constraint(restrict: stack, authority:self)
////      .centerXs.__
////      .tops.fix(40).__
////      .heights.relative(0.6).__
////      .widths.relative(0.87).__
//    
//    Constraint(restrict: description, authority:self)
//      .widths.relative(0.80).__
//    
//    Constraint(restrict: goBTN, authority:self)
//      .widths.relative(0.6).__
//      .heights.relative(0.1).__
//    
//    for line in [emailTF, line1, passwordTF, line2] {
//      Constraint(restrict: line, authority:self)
//        .widths.relative(0.92).__
//    }
//    

    
  }
    
  func clickCheckBTN(sender:UIButton){
        if isChecked == true {
            isChecked = false
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isChecked")
            rememberMeBTN.setImage(uncheckedImage, forState: .Normal)

            
        }else{
            isChecked = true
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isChecked")
            rememberMeBTN.setImage(checkedImage, forState: .Normal)
            NSUserDefaults.standardUserDefaults().setValue(emailTF.text, forKey: "userName")
            
            MyKeychainWrapper.mySetObject(passwordTF.text, forKey: "v_Data")
            MyKeychainWrapper.writeToKeychain()

        }
    
        
}
    
    func clickLoginBTN(sender:UIButton) {
        if emailTF.text == NSUserDefaults.standardUserDefaults().valueForKey("userName") as? String && passwordTF
        .text == MyKeychainWrapper.myObjectForKey("v_Data") as? String{
            print("save and login successfully")
            let alertView = UIAlertView()
            alertView.title = "Success"
            alertView.message = "Info Match"
            alertView.addButtonWithTitle("OK")
            alertView.show()

        }else{
            let alertView = UIAlertView()
            alertView.title = "Error"
            alertView.message = "Info Not Match"
            alertView.addButtonWithTitle("OK")
            alertView.show()

        }

    }
    
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
}