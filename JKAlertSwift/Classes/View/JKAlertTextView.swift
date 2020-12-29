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
    public func calculateTextFrame(maxWidth: CGFloat) -> CGRect {
        
        if isHidden { return .zero }
        
        var size = sizeThatFits(CGSize(width: maxWidth, height: CGFloat.infinity))
        size.width = maxWidth
        
        var heightf = Float(size.height)
        heightf = ceilf(heightf)
        
        let sizeHeight = CGFloat(heightf)
        size.height = sizeHeight
        
        var rect: CGRect = .zero
        rect.size = size
        
        return rect
    }
    
    // MARK:
    // MARK: - Override
    
    deinit {
        
        // TODO: - JKTODO Delete
        print("\(Date().addingTimeInterval(TimeInterval(NSTimeZone.system.secondsFromGMT()))), [ClassName: \(type(of: self))], \(#line), \(type(of: self)).\(#function)")
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
            
            UIMenuController.shared.isMenuVisible = false
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
        textContainer.lineFragmentPadding = 0.0
        textContainerInset = .zero
        showsHorizontalScrollIndicator = false
    }
}
