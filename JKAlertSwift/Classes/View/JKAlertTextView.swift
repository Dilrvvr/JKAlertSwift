//
//  JKAlertTextView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/11/9.
//

import UIKit

class JKAlertTextView: UITextView {

    // MARK:
    // MARK: - Public Methods
    
    
    
    // MARK:
    // MARK: - Public Property
    
    
    
    // MARK:
    // MARK: - Override
    
    deinit {
        
        print("[ClassName: \(type(of: self))], \(#line), \(type(of: self)).\(#function)")
    }
    
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
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
    internal func initializeProperty() {
        
    }
    
    /** 构造函数初始化时调用 注意调用super */
    internal func initialization() {
        
        initializeProperty()
        createUI()
        layoutUI()
        initializeUIData()
    }
    
    /** 创建UI 交给子类重写 super自动调用该方法 */
    internal func createUI() {
        
    }
    
    /** 布局UI 交给子类重写 super自动调用该方法 */
    internal func layoutUI() {
        
    }
    
    /** 初始化UI数据 交给子类重写 super自动调用该方法 */
    internal func initializeUIData() {
        
    }
    
    // MARK:
    // MARK: - Private Property
    
    
    
}
