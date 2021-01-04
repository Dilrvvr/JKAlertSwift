//
//  ViewController.swift
//  JKAlertSwift
//
//  Created by albert on 2020/11/9.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = JKAlertThemeManager.shared
        
        if #available(iOS 13.0, *) {
            
            view.backgroundColor = UIColor.systemBackground
            
        } else {
            
            view.backgroundColor = .white
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let alertView = JKAlertView.alertView(title: "123", message: "12", style: .plain)
        
        alertView.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

