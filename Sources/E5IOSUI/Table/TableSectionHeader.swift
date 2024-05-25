/*
 E5IOSUI
 Basic classes and extensions for reuse
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class TableSectionHeader : UIView{
    
    open func setupView(title: String){
        let label = TableSectionHeaderLabel()
        label.text = title
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        addSubviewCentered(label, centerX: self.centerXAnchor, centerY: self.centerYAnchor)
    }
    
}

open class TableSectionHeaderLabel: UILabel {
    
    override open var intrinsicContentSize: CGSize{
        return getExtendedIntrinsicContentSize(originalSize: super.intrinsicContentSize)
    }
    
}
