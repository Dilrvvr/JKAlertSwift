//
//  ViewController.swift
//  JKAlertSwift
//
//  Created by jkayb123cool@gmail.com on 08/24/2020.
//  Copyright (c) 2020 jkayb123cool@gmail.com. All rights reserved.
//

import UIKit
import JKAlertSwift

class ViewController: UIViewController {
    
    weak var alertView: JKAlertView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let alertView = JKAlertView(frame: view.bounds)
        
        view.addSubview(alertView)
        
        self.alertView = alertView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

