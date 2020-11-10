//
//  JKAlertBaseView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/8/24.
//

import UIKit

public class JKAlertBaseView: UIView {
    
    // MARK:
    // MARK: - Public Methods
    
    
    
    // MARK:
    // MARK: - Public Property
    
    /**
     * 是否自动添加基本的view
     * 包括backgroundView & contentView
     * 默认YES，子类重写getter
     */
    private(set) var autoAddBasicViews: Bool = true
    
    /** backgroundView */
    public private(set) lazy var backgroundView: UIView = {
        
        let backgroundView = UIView()
        
        backgroundView.isUserInteractionEnabled = false
        
        return backgroundView
    }()
    
    /** contentView */
    public private(set) lazy var contentView: UIView = {
        
        let contentView = UIView()
        
        return contentView
    }()
    
    // MARK:
    // MARK: - Override
    
    deinit {
        
        // TODO: - JKTODO Delete
        print("\(Date().addingTimeInterval(TimeInterval(NSTimeZone.system.secondsFromGMT()))), [ClassName: \(type(of: self))], \(#line), \(type(of: self)).\(#function)")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialization()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialization()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if autoAddBasicViews {
            
            backgroundView.frame = bounds
            contentView.frame = bounds
        }
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
        
        if autoAddBasicViews {
            
            self.insertSubview(backgroundView, at: 0)
            self.insertSubview(contentView, at: 1)
        }
    }
    
    /** 布局UI 交给子类重写 super自动调用该方法 */
    internal func layoutUI() {
        
        if autoAddBasicViews {
            
            JKAlertConstraintManager.addZeroEdgeConstraints(targetView: backgroundView, constraintsView: self)
            
            JKAlertConstraintManager.addZeroEdgeConstraints(targetView: contentView, constraintsView: self)
        }
    }
    
    /** 初始化UI数据 交给子类重写 super自动调用该方法 */
    internal func initializeUIData() {
        
    }
    
    // MARK:
    // MARK: - Private Property
    
    
    
}
