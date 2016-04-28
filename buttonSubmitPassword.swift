//
//  buttonSubmitPassword.swift
//  cockatoo
//
//  Created by Scott Dennen on 4/27/16.
//  Copyright © 2016 Scott Dennen. All rights reserved.
//
import UIKit

class SubmitPasswordBtn:UIButton {
  var cvstPosition: Double = 0
  
  required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
  
  override init(frame:CGRect) {
    super.init(frame:frame)
  }
  
  convenience init() {    // this button be automatically .Custom
    self.init(frame: CGRectZero)
    
    translatesAutoresizingMaskIntoConstraints = false
    
    backgroundColor = colorTwitter()
    
    layer.shadowOffset = CGSizeMake(5.0, 5.0)
    layer.shadowOpacity = 0.50
    layer.shadowRadius = 5.0
    
    
    setTitleColor(UIColor.whiteColor(), forState:.Normal)
    backgroundColor = colorTwitter()
  }
}


