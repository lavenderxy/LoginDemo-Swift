//
//  ViewController.swift
//  navController
//
//  Created by Xinyu Yan on 4/25/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "First Page"
        
        let myView = UIView()
        myView.backgroundColor = UIColor.whiteColor()
        myView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        view.addSubview(myView)
        
        let myLabel = UILabel()
        myLabel.text = "First Page"
        myLabel.frame = CGRectMake(50, 100, 150, 20)
        view.addSubview(myLabel)
        
        let barBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Compose,target: self, action: #selector(ViewController.pressed(_:)))
        self.navigationItem.setRightBarButtonItem(barBtn, animated: true)
        
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(150, 200, 100, 100)
        button.layer.cornerRadius = 0.5*button.bounds.size.width
        button.backgroundColor = colorTwitter()
        button.layer.shadowColor = UIColor.lightGrayColor().CGColor
        button.layer.shadowOffset = CGSizeMake(-4, 4)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 1.0
        
        view.addSubview(button)
        
        
    }
    
    
    func pressed(sender:UIButton){
        let newVC = SecondViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

