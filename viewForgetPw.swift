//
//  viewForgetPw.swift
//  navController
//
//  Created by Xinyu Yan on 4/27/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

import UIKit

class viewForgetPw: UIView {
    
    var emailTF:UITextField!
    
    let goBTN = UIButton()
    let touchBTN = UIButton()
    
    required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        backgroundColor = colorWhite()
        
        
        emailTF = PasswordTextField()
        emailTF.placeholder = "someone@example.com"
        emailTF.textAlignment = .Center
        
        
        let saveLabel = UILabel()
        saveLabel.text = "Email or phone number"
        saveLabel.textColor = colorTwitter()
        saveLabel.font =  saveLabel.font.fontWithSize(18)
        saveLabel.textAlignment = NSTextAlignment.Left
    
        
        goBTN.setTitle("Continue", forState:.Normal)
        goBTN.translatesAutoresizingMaskIntoConstraints = false
        goBTN.setTitleColor(UIColor.whiteColor(), forState:.Normal)
        goBTN.backgroundColor = colorTwitter()
        goBTN.layer.shadowOffset = CGSizeMake(5.0, 5.0)
        goBTN.layer.shadowOpacity = 0.3
        goBTN.layer.shadowRadius = 5.0
        goBTN.layer.shadowColor = colorGrey().CGColor
        //    goBTN.addTarget(self, action:#selector(LoginController.didTapGoBTN), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        let stackTextFields = UIStackView()
        stackTextFields.translatesAutoresizingMaskIntoConstraints = false
        stackTextFields.axis = .Vertical
        stackTextFields.spacing = 15
        stackTextFields.alignment = .Center
        stackTextFields.distribution = .Fill
        
        let line1 = lineHorizontal()
        
        stackTextFields.addArrangedSubview(emailTF)
        stackTextFields.addArrangedSubview(line1)
        
        let stackSaveInfo = UIStackView()
        stackSaveInfo.distribution = .Fill
        stackSaveInfo.axis = .Horizontal
        stackSaveInfo.spacing = 10
        stackSaveInfo.addArrangedSubview(saveLabel)
        
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .Vertical
        stack.alignment = .Center
        stack.distribution = .EqualSpacing
        
        stack.addArrangedSubview(stackSaveInfo)
        stack.addArrangedSubview(stackTextFields)
        stack.addArrangedSubview(goBTN)
        
        addSubview(stack)
        
        Bind(restrict: stack, authority:self)
            .centerXs
            .tops.staticOffset(150)
            .heights.relativeOffset(0.3)
            .__
        
        
        
        Bind(restrict: goBTN, authority:self)
            .widths.relativeOffset(0.6)
            .heights.relativeOffset(0.1)
            .__
        
        
        
        for line in [emailTF, line1] {
            Bind(restrict: line, authority:self)
                .widths.relativeOffset(0.92)
                .__
        }
        
        
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }



}
