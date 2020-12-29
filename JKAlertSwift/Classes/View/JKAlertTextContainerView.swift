//
//  JKAlertTextContainerView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/11/9.
//

import UIKit

class JKAlertTextContainerView: JKAlertBaseView {
    
    // MARK:
    // MARK: - Public Property
    
    /** textView */
    private(set) var textView: JKAlertTextView = JKAlertTextView()
    
    // MARK:
    // MARK: - Public Methods
    
    /** 计算frame */
    public func calculateTextFrame(contentWidth: CGFloat, minHeight: CGFloat) -> CGRect {
        
        var rect = textView.calculateTextFrame(maxWidth: contentWidth)
        
        if rect.size.height < minHeight {
            
            rect.size.height = minHeight
        }
        
        return rect
    }
    
    // MARK:
    // MARK: - Override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textView.center = CGPoint(x: bounds.width * 0.5, y: bounds.height * 0.5)
    }
    
    // MARK:
    // MARK: - Private Methods
    
    
    
    // MARK:
    // MARK: - Private Selector
    
    
    
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
    
    override var autoAddBasicViews: Bool {
        
        get {
            
            return false
        }
    }
}
