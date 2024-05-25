/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import Foundation
import UIKit

open class TextButton : UIButton{
    
    public var hasBorder: Bool
    
    public init(text: String, tintColor: UIColor = .systemBlue, backgroundColor: UIColor? = .systemBackground, withBorder: Bool = true){
        self.hasBorder = withBorder
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        setTitleColor(tintColor, for: .normal)
        self.tintColor = tintColor
        if let bgcol = backgroundColor{
            self.backgroundColor = bgcol
        }
        if hasBorder{
            setGrayRoundedBorders()
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var intrinsicContentSize: CGSize{
        if hasBorder{
            let size = getExtendedIntrinsicContentSize(originalSize: super.intrinsicContentSize)
            return CGSize(width: size.width + 2*defaultInset, height: size.height)
        }
        return super.intrinsicContentSize
    }
    
}
