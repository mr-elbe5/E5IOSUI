/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import UIKit

public protocol RadioGroupDelegate{
    func valueDidChangeTo(idx: Int, value: String)
}

open class RadioGroup: UIView{
    
    public var selectedIndex : Int = -1
    public var selectedValue : String{
        if selectedIndex != -1{
            return radioViews[selectedIndex].title
        }
        return ""
    }
    
    public var radioViews = Array<RadioGroupButton>()
    public var stackView = UIStackView()
    
    public var delegate: RadioGroupDelegate? = nil
    
    public init(){
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground
        setRoundedBorders()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(values: Array<String>, includingNobody: Bool = false){
        stackView.axis = .vertical
        stackView.alignment = .leading
        addSubviewFilling(stackView)
        if includingNobody{
            let radioView = RadioGroupButton()
            radioViews.append(radioView)
            radioView.setup(title: "nobody".localize(), index: -1)
            radioView.delegate = self
            stackView.addArrangedSubview(radioView)
        }
        for i in 0..<values.count{
            let radioView = RadioGroupButton()
            radioViews.append(radioView)
            radioView.setup(title: values[i], index: i)
            radioView.delegate = self
            stackView.addArrangedSubview(radioView)
        }
    }
    
    public func select(index: Int){
        selectedIndex = index
        for radioView in radioViews{
            radioView.isOn = radioView.index == index
        }
    }
    
}

extension RadioGroup: RadioGroupButtonDelegate{
    
    public func radioIsSelected(index: Int) {
        selectedIndex = index
        for radioView in radioViews{
            radioView.isOn = radioView.index == index
        }
        delegate?.valueDidChangeTo(idx: selectedIndex, value: selectedValue)
    }
    
}
