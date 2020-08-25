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
    
    public lazy var backgroundView: UIView = {
        
        let backgroundView = UIView()
        backgroundView.isUserInteractionEnabled = false
        self.insertSubview(backgroundView, at: 0)
        
        return backgroundView
    }()
    
    public lazy var contentView: UIView = {
        
        let contentView = UIView()
        self.insertSubview(contentView, at: 1)
        
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
        
        backgroundView.frame = bounds
        contentView.frame = bounds
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
        
        JKAlertVisualFormatConstraintManager.addZeroEdgeConstraints(targetView: backgroundView, constraintsView: self)
        
        JKAlertVisualFormatConstraintManager.addZeroEdgeConstraints(targetView: contentView, constraintsView: self)
    }
    
    /** 初始化UI数据 交给子类重写 super自动调用该方法 */
    internal func initializeUIData() {
        
    }
    
    // MARK:
    // MARK: - Private Property
    
    
    
}