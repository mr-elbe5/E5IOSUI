/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import UIKit

public protocol RadioGroupButtonDelegate{
    func radioIsSelected(index: Int)
}

open class RadioGroupButton: UIView{
    
    public var label = UILabel()
    public var radioButton = RadioButton()
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
            radioButton.isOn
        }
        set{
            radioButton.isOn = newValue
        }
    }
    
    public var delegate: RadioGroupButtonDelegate? = nil
    
    open func setup(title: String, index: Int, isOn: Bool = false){
        self.index = index
        self.title = title
        self.isOn = isOn
        radioButton.delegate = self
        addSubviewWithAnchors(radioButton, top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, insets: defaultInsets)
        addSubviewWithAnchors(label, top: topAnchor, leading: radioButton.trailingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, insets: defaultInsets)
    }
    
}

extension RadioGroupButton: OnOffIconDelegate{
    
    public func onOffValueDidChange(icon: OnOffIcon) {
        delegate?.radioIsSelected(index: index)
    }
    
}

open class RadioButton: OnOffIcon{
    
    public init(isOn: Bool = false){
        super.init(offImage: UIImage(systemName: "circle")!, onImage: UIImage(systemName: "record.circle")!)
        onColor = .label
        offColor = .label
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func addAction(){
        self.addAction(UIAction(){ action in
            if !self.isOn{
                self.isOn = true
                self.delegate?.onOffValueDidChange(icon: self)
            }
        }, for: .touchDown)
    }
    
}

