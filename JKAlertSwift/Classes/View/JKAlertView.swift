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
    
    
    // MARK:
    // MARK: - Public Property
    
    
    
    // MARK:
    // MARK: - Override
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        solveDidMoveToSuperview()
    }
    
    /** solveDidMoveToSuperview */
    private func solveDidMoveToSuperview() {
        
        // TODO: - JKTODO <#注释#>
        
        guard let realSuperView = self.superview else { return }
        
        frame = realSuperView.bounds

        backgroundView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.backgroundView.alpha = 1.0
            
        }) { (_) in
            
            
        }
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
    
    
    
    // MARK:
    // MARK: - Initialization & Build UI
    
    /** 初始化自身属性 交给子类重写 super自动调用该方法 */
    override func initializeProperty() {
        super.initializeProperty()
        
    }
    
    /** 构造函数初始化时调用 注意调用super */
    override func initialization() {
        super.initialization()
        
    }
    
    /** 创建UI 交给子类重写 super自动调用该方法 */
    override func createUI() {
        super.createUI()
        
    }
    
    /** 布局UI 交给子类重写 super自动调用该方法 */
    override func layoutUI() {
        super.layoutUI()
        
    }
    
    /** 初始化UI数据 交给子类重写 super自动调用该方法 */
    override func initializeUIData() {
        super.initializeUIData()
        
    }
    
    // MARK:
    // MARK: - Private Property
    
    
    
}
