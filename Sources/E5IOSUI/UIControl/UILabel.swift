/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UILabel{
    
    public func setDefaults(text : String){
        self.text = text
    }
    
    public convenience init(text: String){
        self.init()
        self.text = text
        numberOfLines = 0
        textColor = .label
    }
    
    public convenience init(header: String){
        self.init()
        self.text = header
        font = .preferredFont(forTextStyle: .headline)
        numberOfLines = 0
        textColor = .label
    }
    
}

