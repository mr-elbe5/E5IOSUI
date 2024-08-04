/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import UIKit

open class CheckboxGroupView: UIView{
    
    public var selectedIndex : Int = -1
    public var selectedValue : String{
        if selectedIndex != -1{
            return checkboxViews[selectedIndex].title
        }
        return ""
    }
    
    public var onOffCheckbox = CheckboxGroupIcon()
    public var checkboxViews = Array<Checkbox>()
    public var stackView = UIStackView()
    
    public var hasSelection: Bool{
        for checkboxView in checkboxViews{
            if checkboxView.isOn{
                return true
            }
        }
        return false
    }
    
    public init(){
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground
        setRoundedBorders()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(){
        stackView.axis = .vertical
        stackView.alignment = .leading
        addSubviewFilling(stackView)
        onOffCheckbox.setup(isOn: true)
        onOffCheckbox.checkboxIcon.delegate = self
        stackView.addArrangedSubview(onOffCheckbox)
    }
    
    public func addCheckbox(cb: Checkbox){
        checkboxViews.append(cb)
        stackView.addArrangedSubview(cb)
    }
    
    public func select(index: Int){
        selectedIndex = index
        for checkboxView in checkboxViews{
            checkboxView.isOn = checkboxView.index == index
        }
    }
    
}

extension CheckboxGroupView: OnOffIconDelegate{
    
    public func onOffValueDidChange(icon: OnOffIcon) {
        if icon == onOffCheckbox.checkboxIcon{
            for cb in checkboxViews{
                cb.isOn = icon.isOn
            }
        }
    }
    
}

open class CheckboxGroupIcon: UIView{
    
    public var checkboxIcon = CheckboxIcon()
    public var isOn: Bool{
        get{
            checkboxIcon.isOn
        }
        set{
            checkboxIcon.isOn = newValue
        }
    }
    
    public func setup(isOn: Bool = false){
        self.isOn = isOn
        addSubviewFilling(checkboxIcon, insets: defaultInsets)
    }
    
}
