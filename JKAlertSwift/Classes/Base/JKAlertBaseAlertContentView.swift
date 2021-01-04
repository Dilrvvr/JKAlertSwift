//
//  JKAlertBaseAlertContentView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/12/29.
//

import UIKit

protocol JKAlertBaseAlertContentViewDelegate: NSObjectProtocol {
    
    /// 执行action的handler操作
    func alertContentViewExecuteHandlerOfAction(alertContentView: JKAlertBaseAlertContentView, action: JKAlertAction)
    
    /// 执行dismiss操作
    func alertContentViewExecuteGestureDismiss(alertContentView: JKAlertBaseAlertContentView, dismissType: JKAlertView.JKAlertSheetDismissAnimationType)
}

class JKAlertBaseAlertContentView: JKAlertBaseView {

    // MARK:
    // MARK: - Public Property
    
    /// delegate
    public var delegate: JKAlertBaseAlertContentViewDelegate?
    
    /// 圆角 默认10
    public var cornerRadius: CGFloat = 10.0
    
    /// 屏幕的安全区域
    public var screenSafeInsets: UIEdgeInsets = .zero
    
    /// 最大高度
    public var maxHeight: CGFloat = 0.0
    
    /// 弹框宽度
    public var alertWidth: CGFloat = 0.0
    
    /// action数组
    public var actionArray: [JKAlertAction] = [JKAlertAction]()
    
    /// 上部分view
    public lazy var topContentView: JKAlertScrollContentView = {
        
        let topContentView = JKAlertScrollContentView()
        
        topContentView.scrollView.delegate = self
        
        return topContentView
    }()
    
    /// 下部分view
    public lazy var bottomContentView: JKAlertScrollContentView = {
        
        let bottomContentView = JKAlertScrollContentView()
        
        bottomContentView.scrollView.delegate = self
        
        return bottomContentView
    }()
    
    /// 模糊背景
    public lazy var backgroundEffectView: UIVisualEffectView = {
        
        let backgroundEffectView = UIVisualEffectView()
        
        backgroundEffectView.isHidden = true
        backgroundEffectView.clipsToBounds = true
        
        return backgroundEffectView
    }()
    
    /// 自定义背景view
    public var customBackgroundView: UIView? {
        
        willSet {
            
            if let _ = customBackgroundView {
                
                customBackgroundView!.removeFromSuperview()
            }
        }
        
        didSet {
            
            guard let _ = customBackgroundView else { return }
            
            backgroundView.addSubview(customBackgroundView!)
            
            JKAlertConstraintManager.addZeroEdgeConstraints(targetView: customBackgroundView!, constraintsView: backgroundView)
        }
    }
    
    /// 默认的取消action，不需要自带的可以自己设置，不可置为nil
    public lazy var cancelAction: JKAlertAction = {
        
        let cancelAction = JKAlertAction.action(title: "取消", style: .default) { (action: JKAlertAction) in
            
        }
        
        return cancelAction
    }()
    
    
//    - (void)calculateUI NS_REQUIRES_SUPER;
//
//    - (void)restoreAlertBackgroundColor;
    
    // MARK:
    // MARK: - Public Methods
    
    /// calculateUI
    public func calculateUI() {
        
    }
    
    /// calculateUI
    public func restoreAlertBackgroundColor() {
        
    }
    
    // MARK:
    // MARK: - Override
    
    
    
    // MARK:
    // MARK: - Private Methods
    
    
    
    // MARK:
    // MARK: - Private Selector
    
    
    
    // MARK:
    // MARK: - Custom Delegates
    
    
    
    // MARK:
    // MARK: - Initialization & Build UI
    
    /// 初始化自身属性 交给子类重写 super自动调用该方法
    override func initializeProperty() {
        super.initializeProperty()
        
    }
    
    /// 构造函数初始化时调用 注意调用super
    override func initialization() {
        super.initialization()
        
    }
    
    /// 创建UI 交给子类重写 super自动调用该方法
    override func createUI() {
        super.createUI()
        
    }
    
    /// 布局UI 交给子类重写 super自动调用该方法
    override func layoutUI() {
        super.layoutUI()
        
    }
    
    /// 初始化UI数据 交给子类重写 super自动调用该方法
    override func initializeUIData() {
        super.initializeUIData()
        
    }
    
    // MARK:
    // MARK: - Private Property
    
    
    

}

// MARK:
// MARK: - UIScrollViewDelegate

extension JKAlertBaseAlertContentView: UIScrollViewDelegate {
    
}
