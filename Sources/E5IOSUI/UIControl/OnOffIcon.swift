/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

public protocol OnOffIconDelegate{
    func onOffValueDidChange(icon: OnOffIcon)
}

open class OnOffIcon : UIButton{
    
    private var _isOn : Bool
    
    public var isOn: Bool{
        get{
            _isOn
        }
        set{
            _isOn = newValue
            setIconAndColor()
        }
    }
    
    public var onImage : UIImage
    public var offImage : UIImage
    
    public var onColor : UIColor!
    public var offColor : UIColor!
    
    public var delegate : OnOffIconDelegate? = nil
    
    public init(offImage: UIImage, onImage: UIImage, isOn : Bool  = false){
        self.offImage = offImage
        self.onImage = onImage
        self._isOn = isOn
        super.init(frame: .zero)
        onColor = tintColor
        offColor = tintColor
        setImage(isOn ? onImage : offImage, for: .normal)
        self.scaleBy(1.25)
        addAction()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addAction(){
        self.addAction(UIAction(){ action in
            self.isOn = !self.isOn
            self.delegate?.onOffValueDidChange(icon: self)
        }, for: .touchDown)
    }
    
    public func setIconAndColor(){
        if isOn{
            setImage(onImage, for: .normal)
            tintColor = onColor
            setTitleColor(onColor, for: .normal)
        }
        else{
            setImage(offImage, for: .normal)
            tintColor = offColor
            setTitleColor(offColor, for: .normal)
        }
    }
    
}

