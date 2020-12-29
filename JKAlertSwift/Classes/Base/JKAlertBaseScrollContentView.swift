//
//  JKAlertBaseScrollContentView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/12/29.
//

import UIKit

class JKAlertBaseScrollContentView: JKAlertBaseView {
    
    // MARK:
    // MARK: - Public Property
    
    public private(set) lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.isScrollEnabled = false
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        }
        
        if #available(iOS 13.0, *) {
            scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        }
        
        return scrollView;
    }()
    
    /// scrollContentView
    public private(set) lazy var scrollContentView: UIView = {
        
        let scrollContentView = UIView()
        
        return scrollContentView
    }()
    
    /// scrollViewTopConstraint
    public private(set) lazy var scrollViewTopConstraint: NSLayoutConstraint = {
        
        let scrollViewTopConstraint = NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        
        return scrollViewTopConstraint
    }()
    
    /// scrollViewBottomConstraint
    public private(set) lazy var scrollViewBottomConstraint: NSLayoutConstraint = {
        
        let scrollViewBottomConstraint = NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        return scrollViewBottomConstraint
    }()
    
    // MARK:
    // MARK: - Public Methods
    
    
    
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
        
        addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
    }
    
    /// 布局UI 交给子类重写 super自动调用该方法
    override func layoutUI() {
        super.layoutUI()
        
        JKAlertConstraintManager.addConstraints(horizontalFormat: "H:|-0-[view]-0-|", verticalFormat: nil, viewKeyName: "view", targetView: scrollView, constraintsView: self)
        
        addConstraint(scrollViewTopConstraint)
        addConstraint(scrollViewBottomConstraint)
    }
    
    /// 初始化UI数据 交给子类重写 super自动调用该方法
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
