/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UITextField{
    
    public func setDefaults(placeholder : String = ""){
        autocapitalizationType = .none
        autocorrectionType = .no
        self.placeholder = placeholder
        borderStyle = .roundedRect
    }
    
    public func setKeyboardToolbar(doneTitle: String){
        let toolbar : UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: doneTitle, style: .done, target: self, action: #selector(toolbarAction))
        toolbar.items = [flexSpace, done]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    
    @objc public func toolbarAction(){
        self.resignFirstResponder()
    }
    
}

