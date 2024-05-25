/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UIStackView{
    
    public func setupVertical(spacing: CGFloat = 0){
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .equalSpacing
        self.spacing = spacing
    }
    
    public func setupHorizontal(distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0){
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = distribution
        self.spacing = spacing
    }
    
    public func removeAllArrangedSubviews() {
        for subview in subviews {
            removeArrangedSubview(subview)
        }
        removeAllSubviews()
    }
    
    public func addSpacer(){
        addArrangedSubview(UILabel(text: " "))
    }

}

