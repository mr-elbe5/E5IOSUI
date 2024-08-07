/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class LabeledTextField : UIView, UITextFieldDelegate{
    
    private var label = UILabel()
    private var textField = UITextField()
    
    public var text: String{
        get{
            return textField.text ?? ""
        }
        set{
            textField.text = newValue
        }
    }
    
    open func setupView(labelText: String, text: String = "", isHorizontal : Bool = true){
        label.text = labelText
        label.textAlignment = .left
        label.numberOfLines = 0
        addSubview(label)
        
        textField.setDefaults()
        textField.text = text
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        addSubview(textField)
        textField.setKeyboardToolbar(doneTitle: "done".localize(table: "Base"))
        
        if isHorizontal{
            label.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: centerXAnchor, bottom: bottomAnchor)
            textField.setAnchors(top: topAnchor, leading: centerXAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
        }
        else{
            label.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
            textField.setAnchors(top: label.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
        }
    }
    
    public func updateText(_ text: String){
        textField.text = text
    }
    
    @discardableResult
    public func withTextColor(_ color: UIColor) -> LabeledTextField{
        label.textColor = color
        return self
    }
    
}

