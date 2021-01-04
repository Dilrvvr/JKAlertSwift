//
//  JKAlertThemeManager.swift
//  JKAlertSwift
//
//  Created by albert on 2020/12/31.
//

import UIKit

class JKAlertThemeManager: NSObject {
    
    public static let shared = JKAlertThemeManager()
    
    // MARK:
    // MARK: - Public Property
    
    /** themeStyle */
    public var themeStyle: JKAlertThemeStyle = .system {
        
        didSet {
            
            if themeStyle == oldValue { return }
            
            postThemeStyleDidChangeNotification()
        }
    }
    
    /// <#注释#>
    private func postThemeStyleDidChangeNotification() {
        
        NotificationCenter.default.post(name: JKAlertThemeStyleDidChangeNotification, object: themeStyle)
    }
    
    /// 是否自动切换 深色/浅色 模式
    @available(iOS 13.0, *)
    public var autoSwitchDarkMode: Bool {
        
        return themeStyle == .system
    }
    
    /// 当前的系统样式
    @available(iOS 13.0, *)
    public var userInterfaceStyle: UIUserInterfaceStyle {
        
        return UIScreen.main.traitCollection.userInterfaceStyle
    }
    
    /**
     * 浅色主题名称
     * 自动跟随系统切换时的浅色主题名称
     * 默认JKAlertDefaultThemeLight
     */
    public var lightThemeName: String = JKAlertDefaultThemeLight
    
    /**
     * 深色主题名称
     * 自动跟随系统切换时的深色主题名称
     * 默认JKAlertDefaultThemeDark
     */
    public var darkThemeName: String = JKAlertDefaultThemeDark
    
    /**
     * 主题名称
     * 默认JKAlertDefaultThemeLight
     */
    public lazy var themeName: String = {
        
        if #available(iOS 13.0, *) {
            
            return (UIUserInterfaceStyle.dark == self.userInterfaceStyle) ? self.darkThemeName : self.lightThemeName
        }
        
        return self.lightThemeName
    }()
    
    // MARK:
    // MARK: - Public Methods
    
    /// 判断当前是否深色模式
    public func checkIsDarkMode() -> Bool {
        
        var isDark = false
        
        if #available(iOS 13.0, *) {
            
            if (autoSwitchDarkMode) { // 自动切换
                
                isDark = (UIUserInterfaceStyle.dark == userInterfaceStyle)
                
                return isDark
            }
        }
        
        // 不自动切换
        
        isDark = (themeName == darkThemeName)
        
        return isDark
    }
    
    // MARK:
    // MARK: - Override
    
    private override init() {
        super.init()
        
        JKAlertThemeUtility.keyWindow?.addSubview(JKAlertThemeView.shared)
    }
    
    // MARK:
    // MARK: - Private Methods
    
    /// 监听系统模式变化
    @available(iOS 13.0, *)
    fileprivate func userInterfaceStyleDidChange(style: UIUserInterfaceStyle) {
       
    }
    
    // MARK:
    // MARK: - Private Selector
    
    
    
    // MARK:
    // MARK: - Custom Delegates
    
    // MARK:
    // MARK: - Private Property
    
    
    
    
}

fileprivate class JKAlertThemeView: UIView {
    
    static let shared: JKAlertThemeView = {
        
        let sharedView = JKAlertThemeView(frame: UIScreen.main.bounds)
        
        sharedView.isUserInteractionEnabled = false
        //sharedView.windowLevel = (.alert + 1.0)
        sharedView.isHidden = false
        sharedView.isOpaque = false
        sharedView.backgroundColor = .clear
        sharedView.layer.backgroundColor = UIColor.clear.cgColor
        
        //sharedView.rootViewController = UIViewController()
        
        return sharedView
    }()
    
    // MARK:
    // MARK: - Override
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                
                JKAlertThemeManager.shared.userInterfaceStyleDidChange(style: traitCollection.userInterfaceStyle)
            }
        }
    }
}
