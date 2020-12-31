//
//  JKAlertUtility.swift
//  JKAlertSwift
//
//  Created by albert on 2020/9/2.
//

import UIKit
import AudioToolbox

// MARK:
// MARK: - 全局属性

public var JKAlertScreenScale: CGFloat {
    
    return UIScreen.main.scale
}

public var JKAlertScreenBounds: CGRect {
    
    return UIScreen.main.bounds
}

public var JKAlertScreenWidth: CGFloat {
    
    return UIScreen.main.bounds.width
}

public var JKAlertScreenHeight: CGFloat {
    
    return UIScreen.main.bounds.height
}

// MARK:
// MARK: - 全局函数

/// 快速设置颜色
public func JKAlertColor(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
    
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

/// RGB相等颜色
public func JKAlertSameRGBColor(_ rgb: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
    
    return JKAlertColor(rgb, rgb, rgb, alpha)
}

/// 随机色
public func JKAlertRandomColor(_ alpha: CGFloat = 1.0) -> UIColor {
    
    let red = CGFloat(arc4random_uniform(256))
    let green = CGFloat(arc4random_uniform(256))
    let blue = CGFloat(arc4random_uniform(256))
    
    return JKAlertColor(red, green, blue, alpha)
}

/// 系统蓝色
public func JKAlertSystemBlueColor() -> UIColor {
    
    return JKAlertColor(0.0, 122.0, 255.0)
}

/// 系统蓝色
public func JKAlertSystemRedColor() -> UIColor {
    
    return JKAlertColor(255.0, 59.0, 48.0)
}

// MARK:
// MARK: - JKAlertUtility

class JKAlertUtility: NSObject {
    
    /// 判断当前是否深色模式
    public class var isDarkMode: Bool {
        
        return JKAlertThemeManager.shared.checkIsDarkMode()
    }
    
    /// 全局背景色 浅色模式 rgb 247
    public static let globalLightBackgroundColor: UIColor = JKAlertSameRGBColor(247.0)
    
    /// 全局背景色 深色模式 rgb 24
    public static let globalDarkBackgroundColor: UIColor = JKAlertSameRGBColor(24.0)
    
    /// 背景色 浅色模式 rgb254
    public static let lightBackgroundColor: UIColor = JKAlertSameRGBColor(255.0)
    
    /// 背景色 深色模式 rgb 30
    public static let darkBackgroundColor: UIColor = JKAlertSameRGBColor(30.0)
    
    /// 高亮背景色 浅色模式 rgb 229
    public static let highlightedLightBackgroundColor: UIColor = JKAlertSameRGBColor(229.0)
    
    /// 高亮背景色 深色模式 rgb 37.5
    public static let highlightedDarkBackgroundColor: UIColor = JKAlertSameRGBColor(37.5)
    
    /// 全局分隔线粗细 1.0 / [UIScreen mainScreen].scale
    public static let separatorLineThickness: CGFloat = 1.0 / UIScreen.main.scale
    
    /// 全局分隔线背景色 浅色模式 rgb 217
    public static let separatorLineLightColor: UIColor = JKAlertSameRGBColor(217.0)
    
    /// 全局分隔线背景色 深色模式 rgb 53
    public static let separatorLineDarkColor: UIColor = JKAlertSameRGBColor(53.0)
    
    /// 是否iPad
    public static let isDeviceiPad: Bool = (UI_USER_INTERFACE_IDIOM() == .pad)
    
    /// 是否X设备
    public class var isDeviceX: Bool {
        
        if isDeviceiPad {
            
            return false
        }
        
        if #available(iOS 11.0, *) {
            
            guard let _ = keyWindow else { return false }
            
            return keyWindow!.safeAreaInsets.bottom > 0.0
        }
        
        return false
    }
    
    /// 当前是否横屏
    public class var isLandscape: Bool {
        
        return  UIScreen.main.bounds.width > UIScreen.main.bounds.height
    }
    
    /// 当前HomeIndicator高度
    public class var currentHomeIndicatorHeight: CGFloat {
        
        return isDeviceX ? (isLandscape ? 21.0 : 34.0) : 0.0
    }
    
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
    
    /// 获取keyWindow的safeAreaInsets
    public class var safeAreaInset: UIEdgeInsets {
        
        var safeAreaInset: UIEdgeInsets = .zero
        
        if #available(iOS 11.0, *) {
            
            if let _ = keyWindow {
                
                safeAreaInset = keyWindow!.safeAreaInsets
            }
        }
        
        return safeAreaInset
    }
    
    /// 导航条高度
    public class var navigationBarHeight: CGFloat {
        
        if (isDeviceiPad) { // iPad
            
            return isLandscape ? 70.0 : 64.0
            
        } else { // iPhone
            
            return isLandscape ? (isDeviceX ? 44.0 : 32.0) : (isDeviceX ? 88.0 : 64.0)
        }
    }
    
    /// 目前iPhone屏幕最大宽度
    public static let iPhoneMaxScreenWidth: CGFloat = 428.0
    
    /// 让手机振动一下
    public class func vibrateDevice() {
        
        // iPad没有震动
        if isDeviceiPad { return }
        
        // 普通短震，3D Touch 中 Peek 震动反馈
        //AudioServicesPlaySystemSound(1519)
        
        // 普通短震，3D Touch 中 Pop 震动反馈
        //AudioServicesPlaySystemSound(1520)
        
        // 连续三次短震
        //AudioServicesPlaySystemSound(1521)
        
        //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
        if #available(iOS 10.0, *) {
            
            let feedbackGenertor = UIImpactFeedbackGenerator(style: .medium)
            
            feedbackGenertor.impactOccurred()
        }
    }
    
    // TODO: - JKTODO <#注释#>
    
    /*
     /// 仅DEBUG下执行
     + (void)debugExecute:(void (^)(void))executeBlock {
     #if defined(DEBUG)
     !executeBlock ? : executeBlock()
     #endif
     }
     
     /// 在DEBUG/Develop下执行
     + (void)debugDevelopExecute:(void (^)(void))executeBlock {
     #if defined(DEBUG) || defined(CONFIGURATION_Develop)
     !executeBlock ? : executeBlock()
     #endif
     }
     
     /// 弹框展示debug信息
     + (void)showDebugAlertWithTitle:(NSString *)title
     message:(NSString *)message
     delay:(NSTimeInterval)delay {
     #if defined(DEBUG)
     [self _showAlertWithTitle:title message:message delay:delay]
     #endif
     }
     
     /// 弹框展示debug信息
     + (void)showDebugDevelopAlertWithTitle:(NSString *)title
     message:(NSString *)message
     delay:(NSTimeInterval)delay {
     #if defined(DEBUG) || defined(CONFIGURATION_Develop)
     [self _showAlertWithTitle:title message:message delay:delay]
     #endif
     }
     
     + (void)_showAlertWithTitle:(NSString *)title
     message:(NSString *)message
     delay:(NSTimeInterval)delay {
     
     dispatch_async(dispatch_get_main_queue(), ^{
     
     JKAlertView *alertView = [JKAlertView alertViewWithTitle:[@"JKDebug-" stringByAppendingString:(title ? title : @"")] message:[@"--- 此弹框仅用于调试 ---\n\n" stringByAppendingString:(message ? message : @"")] style:(JKAlertStyleAlert)]
     
     alertView.makeMessageAlignment(NSTextAlignmentLeft)
     .makeTitleMessageShouldSelectText(YES)
     .makePlainWidth([UIScreen mainScreen].bounds.size.width - 30.0)
     .makeHudAutoReduceWidth(YES)
     
     [alertView addAction:[JKAlertAction actionWithTitle:@"Copy" style:(JKAlertActionStyleDefault) handler:^(JKAlertAction *action) {
     
     [UIPasteboard generalPasteboard].string = message
     }]]
     
     [alertView addAction:[JKAlertAction actionWithTitle:@"OK" style:(JKAlertActionStyleDefault) handler:^(JKAlertAction *action) {
     
     }]]
     
     if (delay <= 0) {
     
     [alertView show]
     
     return
     }
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     
     [alertView show]
     })
     })
     } // */
}
