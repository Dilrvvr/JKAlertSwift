//
//  JKAlertTextView.swift
//  JKAlertSwift
//
//  Created by albert on 2020/11/9.
//

import UIKit

class JKAlertTextView: UITextView {
    
    // MARK:
    // MARK: - Public Property
    
    /** 是否可以选择文字 */
    public var selectTextEnabled = false
    
    // MARK:
    // MARK: - Public Methods
    
    /** 计算frame */
    public func calculateTextFrame(maxWidth: CGFloat, minHeight: CGFloat, originY: CGFloat, superView: UIView) -> CGRect {
        
        if isHidden { return .zero }
        
        var rect = frame
        
        rect.origin.y = originY
        rect.size = sizeThatFits(CGSize(width: maxWidth, height: CGFloat.infinity))
        rect.size.width = maxWidth
        rect.size.height = ceil(rect.size.height)
        
        if (rect.size.height < minHeight) {
            
            textContainerInset = UIEdgeInsets(top: (minHeight - rect.size.height) * 0.5, left: 0.0, bottom: 0.0, right: 0.0)
            
            rect.size.height = minHeight
            
        } else {
            
            textContainerInset = .zero
        }
        
        frame = rect
        
        center.x = superView.frame.size.width * 0.5
        
        return rect
    }
    
    // MARK:
    // MARK: - Override
    
    deinit {
        
        print("[ClassName: \(type(of: self))], \(#line), \(type(of: self)).\(#function)")
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        initialization()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialization()
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        if selectTextEnabled {
            
            return true
        }
        
        resignFirstResponder()
        
        if #available(iOS 13.0, *) {
            
            UIMenuController.shared.hideMenu(from: self)
            
        } else {
            
            UIMenuController.shared .isMenuVisible = false
        }
        
        return false
    }
    
    // MARK:
    // MARK: - Initialization & Build UI
    
    /** 构造函数初始化时调用 */
    internal func initialization() {
        
        backgroundColor = nil
        textAlignment = .center
        scrollsToTop = false
        isEditable = false
        textContainer.lineFragmentPadding = 0
        textContainerInset = .zero
        showsHorizontalScrollIndicator = false
    }
}
