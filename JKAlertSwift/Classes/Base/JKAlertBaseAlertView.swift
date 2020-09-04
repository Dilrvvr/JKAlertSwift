//
//  JKAlertBaseAlertView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/8/24.
//

import UIKit

public class JKAlertBaseAlertView: JKAlertBaseView {
    
    // MARK:
    // MARK: - Public Methods
    
    public enum JKAlertStyle : Int {
        
        /**
         * none
         * 该样式将默认为JKAlertStylePlain
         */
        case None = 0
        
        /**
         * 面板
         */
        case Plain = 1
        
        
        /** 列表 */
        case ActionSheet = 2
        
        /**
         * collectionView样式
         * 该样式没有message，只有一个title
         */
        case CollectionSheet = 3
        
        /**
         * HUD提示
         * 该样式没有message，只有一个title
         */
        case HUD = 4
        
        /** 顶部通知 */
        //case Notification = 5,
        
        /** 自定义 */
        //case Custom = 6,
        
        /** 面板 */
        //case Alert = 1
    }
    
    /**
     * 全屏背景view
     * 默认nil
     */
    public func makeFullBackgroundView(fullBackgroundView: UIView?) -> Self {
        
        _fullBackgroundView?.removeFromSuperview()
        
        _fullBackgroundView = fullBackgroundView
        
        if let view = _fullBackgroundView {
            
            backgroundView.addSubview(view)
            
            JKAlertVisualFormatConstraintManager.addZeroEdgeConstraints(targetView: view, constraintsView: backgroundView)
        }
        
        return self
    }
    
    // MARK:
    // MARK: - Public Property
    
    
    
    // MARK:
    // MARK: - Override
    
    
    
    // MARK:
    // MARK: - Private Methods
    
    /** restoreFullBackgroundColor */
    internal func restoreFullBackgroundColor() {
        
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    // MARK:
    // MARK: - Private Selector
    
    /** dismissButtonClick */
    @objc internal func dismissButtonClick(button: UIButton) {
        
        // TODO: - JKTODO delete
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.alpha = 0.0
            
        }) { (flag: Bool) in
            
            self.removeFromSuperview()
        }
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
        
        JKAlertVisualFormatConstraintManager.addZeroEdgeConstraints(targetView: dismissButton, constraintsView: contentView)
    }
    
    /** 初始化UI数据 交给子类重写 super自动调用该方法 */
    override func initializeUIData() {
        super.initializeUIData()
        
        restoreFullBackgroundColor()
    }
    
    // MARK:
    // MARK: - Private Property
    
    /**
     * 全屏背景view
     * 默认nil
     */
    private var _fullBackgroundView: UIView?
    
    /** dismissButton */
    internal lazy var dismissButton: UIButton = {
        
        let button = UIButton.init(type: .custom)
        
        button.backgroundColor = nil
        
        self.contentView.insertSubview(button, at: 0)
        
        button.addTarget(self, action: #selector(dismissButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
}
