/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import Foundation

import UIKit

open class LabeledStepperInput : UIView{
    
    private var label = UILabel()
    private var stepper = UIStepper()
    
    public var value: Int{
        get{
            return Int(stepper.value)
        }
        set{
            stepper.value = Double(newValue)
        }
    }
    
    open func setupView(labelText: String, value: Int = 0){
        label.text = labelText
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        addSubview(label)
        
        stepper.backgroundColor = .background
        stepper.setRoundedBorders()
        self.value = value
        addSubview(stepper)
        
        label.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        stepper.setAnchors(top: label.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, insets: .zero)
    }
    
    open func setMinMaxValue(minValue: Int, maxValue: Int){
        stepper.minimumValue = Double(minValue)
        stepper.maximumValue = Double(maxValue)
    }
    
    @discardableResult
    public func withTextColor(_ color: UIColor) -> LabeledStepperInput{
        label.textColor = color
        return self
    }
    
}
