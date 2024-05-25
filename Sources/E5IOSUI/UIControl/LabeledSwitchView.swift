/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

public protocol SwitchDelegate{
    func switchValueDidChange(sender: LabeledSwitchView,isOn: Bool)
}

open class LabeledSwitchView : UIView{
    
    private var label = UILabel()
    private var switcher = UISwitch()
    
    public var delegate : SwitchDelegate? = nil
    
    public var isOn : Bool{
        get{
            switcher.isOn
        }
        set{
            switcher.isOn = newValue
        }
    }
    
    open func setupView(labelText: String, isOn : Bool){
        label.text = labelText
        label.textAlignment = .left
        addSubviewWithAnchors(label, top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor)
        
        switcher.scaleBy(0.75)
        switcher.isOn = isOn
        switcher.addAction(UIAction(){ action in
            self.delegate?.switchValueDidChange(sender: self,isOn: self.switcher.isOn)
        }, for: .valueChanged)
        addSubviewWithAnchors(switcher, top: topAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
    }
    
    public func setEnabled(_ flag: Bool){
        switcher.isEnabled = flag
    }
    
}

