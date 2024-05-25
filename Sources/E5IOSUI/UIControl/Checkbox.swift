/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit
import E5Data

public protocol CheckboxDelegate{
    func checkboxIsSelected(index: Int, value: String)
}

open class Checkbox: UIView{
    
    public var label = UILabel()
    public var checkboxIcon = CheckboxIcon()
    public var index: Int = 0
    public var title: String{
        get{
            label.text ?? ""
        }
        set{
            label.text = newValue
        }
    }
    public var isOn: Bool{
        get{
            checkboxIcon.isOn
        }
        set{
            checkboxIcon.isOn = newValue
        }
    }
    
    public var delegate: CheckboxDelegate? = nil
    
    open func setup(title: String, index: Int = 0, data: IdObject? = nil, isOn: Bool = false){
        self.index = index
        self.title = title
        self.isOn = isOn
        checkboxIcon.delegate = self
        addSubviewWithAnchors(checkboxIcon, top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, insets: defaultInsets)
        addSubviewWithAnchors(label, top: topAnchor, leading: checkboxIcon.trailingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, insets: defaultInsets)
    }
    
}

extension Checkbox: OnOffIconDelegate{
    
    public func onOffValueDidChange(icon: OnOffIcon) {
        delegate?.checkboxIsSelected(index: index, value: title)
    }
    
}

open class CheckboxIcon: OnOffIcon{
    
    public init(isOn: Bool = false){
        super.init(offImage: UIImage(systemName: "square")!, onImage: UIImage(systemName: "checkmark.square")!)
        onColor = .label
        offColor = .label
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



