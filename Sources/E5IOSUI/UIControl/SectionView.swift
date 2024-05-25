/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import UIKit

open class SectionView: UIView{
    
    public init(){
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setRoundedBorders()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

open class ArrangedSectionView: SectionView{
    
    public var stackView = UIStackView()
    
    override public init(){
        super.init()
        stackView.axis = .vertical
        addSubviewFilling(stackView, insets: defaultInsets)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addArrangedSubview(_ subview: UIView){
        stackView.addArrangedSubview(subview)
    }
    
    public func addSpacer(){
        stackView.addSpacer()
    }
    
    public func removeAllArrangedSubviews(){
        stackView.removeAllArrangedSubviews()
    }
    
}

