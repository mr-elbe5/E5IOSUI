/*
 Construction Defect Tracker
 App for tracking construction defects  
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import Foundation

import UIKit

open class LabeledTextInput : UIView, UITextFieldDelegate{
    
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
    
    open func setupView(labelText: String, text: String = "", inline: Bool = false){
        label.text = labelText
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        addSubview(label)
        
        textField.setDefaults()
        textField.text = text
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        addSubview(textField)
        
        if inline{
            label.setAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor)
            textField.setAnchors(top: topAnchor, bottom: bottomAnchor)
                .leading(label.trailingAnchor, inset: defaultInset)
        }
        else{
            label.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
            textField.setAnchors(top: label.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
        }
    }
    
    public func setSecureEntry(){
        textField.isSecureTextEntry = true
    }
    
    public func updateText(_ text: String){
        textField.text = text
    }
    
}

