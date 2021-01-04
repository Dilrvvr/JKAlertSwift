//
//  JKAlertBaseTextContentView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/12/31.
//

import UIKit

class JKAlertBaseTextContentView: JKAlertBaseView {
    
    // MARK:
    // MARK: - Public Property
    
    /// titleTextView
    public private(set) lazy var titleTextView: JKAlertTextContainerView = {
        
        let titleTextView = JKAlertTextContainerView()
        titleTextView.textView.font = UIFont.systemFont(ofSize: 17.0)
        return titleTextView
    }()
    
    /// messageTextView
    public private(set) lazy var messageTextView: JKAlertTextContainerView = {
        
        let messageTextView = JKAlertTextContainerView()
        messageTextView.textView.font = UIFont.systemFont(ofSize: 13.0)
        return messageTextView
    }()
    
    /** messageTextView */
    //    @property (nonatomic, weak, readonly) JKAlertTextContainerView *messageTextView;
    //
    //    /** separatorLineView */
    //    @property (nonatomic, weak) UIView *separatorLineView;
    //
    //    /** title和message之间的分隔线是否隐藏 默认YES */
    //    @property (nonatomic, assign) BOOL separatorLineHidden;
    //
    //    /** contentWidth */
    //    @property (nonatomic, assign) CGFloat contentWidth;
    //
    //    /** screenSafeInsets */
    //    @property (nonatomic, assign) UIEdgeInsets screenSafeInsets;
    //
    //    /** titleInsets 默认(20, 20, 3.5, 20) */
    //    @property (nonatomic, assign) UIEdgeInsets titleInsets;
    //
    //    /** messageInsets 默认(3.5, 20, 20, 20) */
    //    @property (nonatomic, assign) UIEdgeInsets messageInsets;
    //
    //    /** separatorLineInsets 默认全部为0 */
    //    @property (nonatomic, assign) UIEdgeInsets separatorLineInsets;
    //
    //    /** title最小高度(不含inset) 默认0 */
    //    @property (nonatomic, assign) CGFloat titleMinHeight;
    //
    //    /** message最小高度(不含inset) 默认0 */
    //    @property (nonatomic, assign) CGFloat messageMinHeight;
    //
    //    /** 仅有title或message时的最小高度 默认30 */
    //    @property (nonatomic, assign) CGFloat singleMinHeight;
    //
    //
    //    /** customContentView */
    //    @property (nonatomic, weak) UIView *customContentView;
    //
    //    /** customTitleView */
    //    @property (nonatomic, weak) UIView *customTitleView;
    //
    //    /** customMessageView */
    //    @property (nonatomic, weak) UIView *customMessageView;
    //
    //
    //    /** 标题 */
    //    @property (nonatomic, copy) NSString *alertTitle;
    //
    //    /** 富文本标题 */
    //    @property (nonatomic, copy) NSAttributedString *alertAttributedTitle;
    //
    //    /** 提示信息 */
    //    @property (nonatomic, copy) NSString *alertMessage;
    //
    //    /** 富文本提示信息 */
    //    @property (nonatomic, copy) NSAttributedString *attributedMessage;
    //
    //
    //    - (void)calculateUI NS_REQUIRES_SUPER;
    
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
