//
//  JKAlertView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/8/24.
//

import UIKit

public class JKAlertView: JKAlertBaseAlertView {
    
    // MARK:
    // MARK: - Public Methods
    
    /// <#注释#>
    public func show() {
        
        guard let _ = customSuperView else { return }
        
        if shouldHideKeyboardWhenShow {
            
            JKAlertUtility.keyWindow?.endEditing(true)
        }
        
        if isShowed { return }
        
        isShowed = true
        
        customSuperView!.addSubview(self)
    }
    
    // MARK:
    // MARK: - Public Property
    
    /// show的时候是否移除键盘 plain/sheet样式默认YES 其它NO
    public var shouldHideKeyboardWhenShow: Bool = false
    
    // MARK:
    // MARK: - Override
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        solveDidMoveToSuperview()
    }
    
    // MARK:
    // MARK: - Private Methods
    
    
    
    // MARK:
    // MARK: - Private Selector
    
    override func dismissButtonClick(button: UIButton) {
        
        // TODO: - JKTODO delete
        super.dismissButtonClick(button: button)
    }
    
    // MARK:
    // MARK: - Custom Delegates
    
    /// solveDidMoveToSuperview
    private func solveDidMoveToSuperview() {
        
        // TODO: - JKTODO <#注释#>
        
        guard let realSuperView = self.superview else { return }
        
        JKAlertConstraintManager.addZeroEdgeConstraints(targetView: self, constraintsView: realSuperView)

        backgroundView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.backgroundView.alpha = 1.0
            
        }) { (_) in
            
            
        }
    }
    
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
    
    /// customSuperView
    private lazy var customSuperView: UIView? = {
        
        let customSuperView = JKAlertUtility.keyWindow
        
        return customSuperView
    }()
    
    /// 是否已经展示
    private var isShowed: Bool = false
}
