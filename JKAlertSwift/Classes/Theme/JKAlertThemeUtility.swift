//
//  JKAlertThemeUtility.swift
//  JKAlertSwift
//
//  Created by albert on 2020/12/31.
//

import UIKit

// MARK:
// MARK: - 常量

/** 浅色主题名称 */
public let JKAlertDefaultThemeLight = "JKAlertDefaultThemeLight"

/** 深色主题名称 */
public let JKAlertDefaultThemeDark = "JKAlertDefaultThemeDark";

/** 主题名称改变的通知 */
public let JKAlertThemeDidChangeNotification: NSNotification.Name = NSNotification.Name(rawValue: "JKAlertThemeDidChangeNotification")

/** ThemeStyle改变的通知 */
public let JKAlertThemeStyleDidChangeNotification: NSNotification.Name = Notification.Name(rawValue: "JKAlertThemeStyleDidChangeNotification")

/** 默认的背景色handlerKey */
public let JKAlertThemeBackgroundColorHandlerKey = "backgroundColor";

/** 默认的字体颜色handlerKey */
public let JKAlertThemeTextColorHandlerKey = "textColor";

// MARK:
// MARK: - 枚举

enum JKAlertThemeStyle: Int {
    
    /// 跟随系统
    case system = 0
    
    /// 浅色
    case light = 1
    
    /// 深色
    case dark = 2
}

// MARK:
// MARK: - Utility

class JKAlertThemeUtility: NSObject {
    
    /// keyWindow
    public class var keyWindow: UIWindow? {
        
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
