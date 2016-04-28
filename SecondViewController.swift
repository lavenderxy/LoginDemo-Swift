//
//  SecondViewController.swift
//  navController
//
//  Created by Xinyu Yan on 4/25/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

import UIKit
import LocalAuthentication

class SecondViewController: UIViewController {
    let contentView = LoginView()
    var context = LAContext()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        navigationItem.title = "Log In"
        
        
        //custom backbuttonItem
        let myBackButton = UIButton(type: UIButtonType.System) as UIButton
        myBackButton.addTarget(self, action: #selector(SecondViewController.clickBackBt(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle("Back", forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        let myCustomBackButtonItem: UIBarButtonItem = UIBarButtonItem(customView:myBackButton)
        self.navigationItem.leftBarButtonItem = myCustomBackButtonItem
        view = contentView

        
        if contentView.isChecked == true  && context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: nil){
            contentView.touchBTN.hidden = false
        }else{
            contentView.touchBTN.hidden = true
        }
        contentView.touchBTN.addTarget(self, action: #selector(SecondViewController.clickTouchID(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        contentView.forgetPwBTN.addTarget(self, action: #selector(SecondViewController.forgetPW(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//
    }
    
    func clickBackBt(sender:UIBarButtonItem){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func forgetPW(sender:UIButton){
        let forgetPwVC = ForgetPwViewController()
        self.presentViewController(forgetPwVC, animated: true, completion: nil)
    }
    
    func clickTouchID(sender:UIButton){
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error:nil) {
            
            // 2.
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: "Logging in with Touch ID",
                                   reply: { (success : Bool, error : NSError? ) -> Void in
                                    
                                    // 3.
                                    dispatch_async(dispatch_get_main_queue(), {
                                        if success {
                                            print("success")
                                        }
                                        
                                        if error != nil {
                                            
                                            var message : NSString
                                            var showAlert : Bool
                                            
                                            // 4.
                                            switch(error!.code) {
                                            case LAError.AuthenticationFailed.rawValue:
                                                message = "There was a problem verifying your identity."
                                                showAlert = true
                                                break;
                                            case LAError.UserCancel.rawValue:
                                                message = "You pressed cancel."
                                                showAlert = true
                                                break;
                                            case LAError.UserFallback.rawValue:
                                                message = "You pressed password."
                                                showAlert = true
                                                break;
                                            default:
                                                showAlert = true
                                                message = "Touch ID may not be configured"
                                                break;
                                            }
                                            
                                            let alertView = UIAlertController(title: "Error",
                                                message: message as String, preferredStyle:.Alert)
                                            let okAction = UIAlertAction(title: "Darn!", style: .Default, handler: nil)
                                            alertView.addAction(okAction)
                                            if showAlert {
                                                self.presentViewController(alertView, animated: true, completion: nil)
                                            }
                                            
                                        }
                                    })
                                    
            })
        } else {
            // 5.
            let alertView = UIAlertController(title: "Error",
                                              message: "Touch ID not available" as String, preferredStyle:.Alert)
            let okAction = UIAlertAction(title: "Darn!", style: .Default, handler: nil)
            alertView.addAction(okAction)
            self.presentViewController(alertView, animated: true, completion: nil)
            
        }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
