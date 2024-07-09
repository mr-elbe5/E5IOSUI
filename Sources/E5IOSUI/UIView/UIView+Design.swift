/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UIView{
    
    public var borderColor: UIColor{
        .lightGray
    }
    
    public var transparentColor : UIColor{
        if isDarkMode{
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        }
        else{
            return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.6)
        }
    }
    
    public var iconColor : UIColor{
        UIColor(red: 0.0, green: 0.5, blue: 0.7, alpha: 1.0)
    }
    
    public var lightIconColor : UIColor{
        UIColor(red: 0.0, green: 0.7, blue: 0.9, alpha: 1.0)
    }
    
    public var isDarkMode: Bool {
        self.traitCollection.userInterfaceStyle == .dark
    }
    
    @discardableResult
    public func setBackground(_ color:UIColor) -> UIView{
        backgroundColor = color
        return self
    }
    
    @discardableResult
    public func setRoundedEdges(radius: CGFloat = 5) -> UIView{
        layer.borderWidth = 0
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    public func setRoundedBorders(radius: CGFloat = 5) -> UIView{
        layer.borderWidth = 0.5
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    public func setGrayRoundedBorders(radius: CGFloat = 5) -> UIView{
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }
    
}

