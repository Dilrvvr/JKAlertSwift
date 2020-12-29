//
//  JKAlertUtility.swift
//  JKAlertSwift
//
//  Created by albert on 2020/9/2.
//

import UIKit

class JKAlertUtility: NSObject {
    
    /// keyWindow
    public class var keyWindow: UIWindow? {
        
        get {
            
            var keyWindow: UIWindow?
            
            guard let appDelegate = UIApplication.shared.delegate else { return keyWindow }
            
            if appDelegate.responds(to: Selector(("window"))) {
                
                keyWindow = appDelegate.window as? UIWindow
                
            } else {
                
                let windows = UIApplication.shared.windows
                
                for window in windows {
                    
                    if window.isHidden {
                        
                        continue
                    }
                    
                    keyWindow = window
                    
                    break
                }
            }
            
            return keyWindow
        }
    }
}
