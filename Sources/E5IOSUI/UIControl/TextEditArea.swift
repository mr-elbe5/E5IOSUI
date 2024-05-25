/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class TextEditArea : UITextView{
    
    private let placeholderTextView: UITextView = {
        let tv = UITextView()
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.isScrollEnabled = false
        tv.textColor = .placeholderText
        tv.isUserInteractionEnabled = false
        return tv
    }()
    
    public var placeholder: String? {
        get {
            return placeholderTextView.text
        }
        set {
            placeholderTextView.text = newValue
        }
    }
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        placeholderTextView.font = UIFont.preferredFont(forTextStyle: .body)
        addSubviewFilling(placeholderTextView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setDefaults(placeholder : String = ""){
        super.setDefaults()
        self.placeholder = placeholder
    }
    
    public func defaultWithBorder() -> TextEditArea{
        setGrayRoundedBorders()
        setDefaults()
        isScrollEnabled = false
        setKeyboardToolbar(doneTitle: "done".localize())
        return self
    }
    
    override public var contentInset: UIEdgeInsets {
        didSet {
            placeholderTextView.contentInset = contentInset
        }
    }
    
    public func setText(_ text: String){
        self.text = text
        placeholderTextView.isHidden = !text.isEmpty
    }
    
    public func textDidChange() {
        invalidateIntrinsicContentSize()
        placeholderTextView.isHidden = !text.isEmpty
    }
    
    override open var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        if size.height == UIView.noIntrinsicMetric {
            layoutManager.glyphRange(for: textContainer)
            size.height = layoutManager.usedRect(for: textContainer).height + textContainerInset.top + textContainerInset.bottom
        }
        return size
    }

}

