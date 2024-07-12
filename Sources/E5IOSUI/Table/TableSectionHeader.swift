/*
 E5IOSUI
 Basic classes and extensions for reuse
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class TableSectionHeader : UIView{
    
    open func setupView(title: String){
        let label = TableSectionHeaderLabel()
        label.backgroundColor = .sectionHeaderBackground
        label.text = title
        label.textColor = .sectionHeaderText
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.setRoundedEdges(radius: 5)
        addSubviewCentered(label, centerX: self.centerXAnchor, centerY: self.centerYAnchor)
    }
    
}

open class TableSectionHeaderLabel: UILabel {
    
    override open var intrinsicContentSize: CGSize{
        return getExtendedIntrinsicContentSize(originalSize: super.intrinsicContentSize)
    }
    
}
