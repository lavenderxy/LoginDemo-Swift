//  Created by Scott Dennen on 2/8/16.
//  Copyright © 2016 Scott Dennen. All rights reserved.

import UIKit

class LoginController: UIViewController {
  let contentView = LoginView()

  var password:String!
  
  func loginProblem(){
    let alertView = UIAlertController(title: "Login Problem",
      message: "Invalid Email or Password" as String, preferredStyle:.Alert)
    let okAction = UIAlertAction(title: "Please Re-Enter!", style: .Default, handler: nil)
    alertView.addAction(okAction)
    self.presentViewController(alertView, animated: true, completion: nil)
    return
  }
  
  func didTapGoBTN(){
    var email:String? = contentView.emailTF.text
    password = contentView.passwordTF.text!

//    if ( email == nil || email == "" ) {
    
      switch email! {
      case "A":
        email    = "blu@test.com"
        password = "password"
        
      case "B":
        email    = "sentry10f3a@twitter.com"
        password = "password"
        
      case "C":
        email    = "na.av.5.a@twitter.com"
        password = "password"

      default:
        email    = "seed@demo.com"
        password = "password"
      }

//    }
    
    
    // Error if blank
    if (email == "" || password == "") { loginProblem() }
    
    //save the login information when click the box
 
    
    // Hide keyboard on touch
    contentView.emailTF.resignFirstResponder()
    contentView.passwordTF.resignFirstResponder()
    
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    edgesForExtendedLayout = .None
    navigationItem.title = "Cockatoo"
    
    contentView.goBTN.addTarget(self, action:#selector(didTapGoBTN), forControlEvents:.TouchUpInside)
    view = contentView
  }
  
  override func viewDidLayoutSubviews() {
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    view.endEditing(true)
  }
  
  override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.Portrait
  }
  
}
