//
//  ViewController.swift
//  JKAlertSwift
//
//  Created by albert on 2020/11/9.
//

import UIKit

class ViewController: UIViewController {
    
    weak var alertView: JKAlertView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let alertView = JKAlertView.alertView(title: "123", message: "12", style: .plain)
        
        view.addSubview(alertView)
        
        self.alertView = alertView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

