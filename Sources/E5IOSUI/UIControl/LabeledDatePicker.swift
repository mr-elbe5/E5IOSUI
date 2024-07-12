/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import Foundation

import UIKit
import E5Data

open class LabeledDatePicker : UIView{
    
    private var label = UILabel()
    private var pickerContainer = UIView()
    private var datePicker = UIDatePicker()
    
    public var date: Date{
        get{
            return datePicker.date
        }
        set{
            datePicker.date = newValue
        }
    }
    
    open func setupView(labelText: String, date: Date = Date.localDate){
        label.text = labelText
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        addSubview(label)
        
        pickerContainer.backgroundColor = .background
        pickerContainer.setRoundedBorders()
        addSubview(pickerContainer)
        
        datePicker.date = date
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.locale = Locale.current
        pickerContainer.addSubviewFilling(datePicker, insets: defaultInsets)
        
        label.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        pickerContainer.setAnchors(top: label.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, insets: narrowInsets)
    }
    
    public func setMinMaxDate(minDate: Date, maxDate: Date){
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
    }
    
    @discardableResult
    public func withTextColor(_ color: UIColor) -> LabeledDatePicker{
        label.textColor = color
        return self
    }
    
}
