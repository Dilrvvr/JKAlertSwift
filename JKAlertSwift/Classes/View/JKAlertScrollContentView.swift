//
//  JKAlertScrollContentView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/12/29.
//

import UIKit

class JKAlertScrollContentView: JKAlertBaseScrollContentView {
    
    /// <#注释#>
    public func updateContentSize() {
        
        scrollView.contentSize = CGSize(width: 0.0, height: bounds.height - scrollViewTopConstraint.constant + scrollViewBottomConstraint.constant)
    }
    
    /// <#注释#>
    public func checkScrollEnabled() {
        
        scrollView.isScrollEnabled = (scrollView.contentSize.height > bounds.height);
    }
    
    /// <#注释#>
    public func updateScrollContentViewFrame() {
        
        scrollContentView.frame = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: scrollView.contentSize.height)
    }
}
