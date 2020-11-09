//
//  JKAlertConstraintManager.swift
//  JKAlertSwift
//
//  Created by albert on 2020/8/24.
//

import UIKit

public class JKAlertConstraintManager: NSObject {
    
    public class func addConstraints(horizontalFormat: String?, verticalFormat: String?, viewKeyName: String, targetView: UIView, constraintsView: UIView) {
        
        targetView.translatesAutoresizingMaskIntoConstraints = false
        
        if let hFormat = horizontalFormat {
            
            let constraints = NSLayoutConstraint.constraints(withVisualFormat: hFormat, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: [viewKeyName : targetView])
            constraintsView.addConstraints(constraints)
        }
        
        if let vFormat = verticalFormat {
            
            let constraints = NSLayoutConstraint.constraints(withVisualFormat: vFormat, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: [viewKeyName : targetView])
            constraintsView.addConstraints(constraints)
        }
    }
    
    public class func addZeroEdgeConstraints(targetView: UIView, constraintsView: UIView) {
        
        addConstraints(horizontalFormat: "H:|-0-[view]-0-|", verticalFormat: "V:|-0-[view]-0-|", viewKeyName: "view", targetView: targetView, constraintsView: constraintsView)
    }
}
