/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UIButton{
    
    public convenience init(name: String, action: UIAction){
        self.init(frame: .zero)
        setTitle(name, for: .normal)
        setTitleColor(.button, for: .normal)
        addAction(action, for: .touchDown)
    }
    
    @discardableResult
    public func asIconButton(_ icon: String, color: UIColor = .icon) -> UIButton{
        setImage(UIImage(systemName: icon), for: .normal)
        self.tintColor = color
        self.scaleBy(1.25)
        return self
    }
    
    @discardableResult
    public func asImageButton(_ image: String) -> UIButton{
        setImage(UIImage(named: image), for: .normal)
        return self
    }
    
    @discardableResult
    public func asTextButton(_ text: String) -> UIButton{
        setTitle(text, for: .normal)
        return self
    }
    
    @discardableResult
    public func withTextColor(color: UIColor) -> UIButton{
        setTitleColor(color, for: .normal)
        return self
    }
    
    @discardableResult
    public func withBackgroundColor(color: UIColor) -> UIButton{
        self.backgroundColor = color
        layer.cornerRadius = 5
        layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    public func withRoundedCorners() -> UIButton{
        layer.cornerRadius = 5
        layer.masksToBounds = true
        return self
    }
    
}

