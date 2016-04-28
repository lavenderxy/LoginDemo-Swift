//
//  ForgetPwViewController.swift
//  navController
//
//  Created by Xinyu Yan on 4/27/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

import UIKit

class ForgetPwViewController: UIViewController {
    
    let contentView = viewForgetPw()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view = contentView
        contentView.goBTN.addTarget(self, action: #selector(ForgetPwViewController.goNext(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func goNext(sender:UIButton){
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ForgetPwViewController: SuccessOverlayDelegate{
    func dismissSuccessOverlay() {
        
    }
}
