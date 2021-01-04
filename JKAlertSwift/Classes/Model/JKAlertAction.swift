//
//  JKAlertAction.swift
//  JKAlertSwift
//
//  Created by albert on 2020/12/29.
//

import UIKit

class JKAlertAction: NSObject {
    
    /// <#注释#>
    public private(set) var title: String?
    
    /// <#注释#>
    public private(set) var attributedTitle: NSAttributedString?
    
    /// <#注释#>
    public private(set) var style: JKAlertActionStyle = .default
    
    /// <#注释#>
    public private(set) var handler: ((_ action: JKAlertAction) -> Void)?
    
    

    /// separatorLineHidden
    public var separatorLineHidden: Bool = false
    
    /// alertView
    public var alertView: JKAlertView?
    
    
    /// <#注释#>
    public class func action(title: String?, style: JKAlertActionStyle, handler: ((_ action: JKAlertAction) -> Void)?) -> Self {
        
        return Self.jk_action(title: title, attributedTitle: nil, style: style, handler: handler)
    }
    
    /// <#注释#>
    public class func action(attributedTitle: NSAttributedString?, style: JKAlertActionStyle, handler: ((_ action: JKAlertAction) -> Void)?) -> Self {
        
        return Self.jk_action(title: nil, attributedTitle: attributedTitle, style: style, handler: handler)
    }
    
    /// <#注释#>
    public class func jk_action(title: String?, attributedTitle: NSAttributedString?, style: JKAlertActionStyle, handler: ((_ action: JKAlertAction) -> Void)?) -> Self {
        
        let action = JKAlertAction()
        
        action.title = title
        action.attributedTitle = attributedTitle
        action.style = style
        action.handler = handler
        
        // TODO: - JKTODO <#注释#>
        //[JKAlertThemeProvider providerWithOwner:action handlerKey:NSStringFromSelector(@selector(refreshAppearanceHandler)) provideHandler:^(JKAlertThemeProvider *provider, JKAlertAction *providerOwner) {
        //
        //!providerOwner.refreshAppearanceHandler ? : providerOwner.refreshAppearanceHandler(providerOwner);
        //}];
        return action as! Self
    }
}

extension JKAlertAction {
    
    /// action样式
    public enum JKAlertActionStyle: Int {
        /**
         * 默认样式
         * 默认黑色字体 RGB都为51
         */
        case `default` = 0
        
        /** 红色字体 */
        case destructive = 1
        
        /** 灰色字体 RGB都为153 */
        case cancel = 2
        
        /** 默认系统蓝色 [UIColor colorWithRed:0 green:122.0/255.0 blue:255.0/255.0 alpha:1] */
        case defaultBlue = 3
    }
}
