/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import Foundation
import UIKit

open class IconButton : UIButton{
    
    public var hasBorder: Bool
    
    public init(icon: String, tintColor: UIColor = .button, backgroundColor: UIColor? = nil, withBorder: Bool = false){
        self.hasBorder = withBorder
        super.init(frame: .zero)
        setImage(UIImage(systemName: icon)?.withTintColor(tintColor, renderingMode: .alwaysOriginal), for: .normal)
        setImage(UIImage(systemName: icon)?.withTintColor(.buttonDisabled, renderingMode: .alwaysOriginal), for: .disabled)
        self.scaleBy(1.25)
        if let bgcol = backgroundColor{
            self.backgroundColor = bgcol
            layer.cornerRadius = 5
            layer.masksToBounds = true
        }
        if hasBorder{
            setGrayRoundedBorders()
        }
    }
    
    public init(image: String, tintColor: UIColor = .button, backgroundColor: UIColor? = nil, withBorder: Bool = true){
        self.hasBorder = withBorder
        super.init(frame: .zero)
        setImage(UIImage(named: image), for: .normal)
        if let bgcol = backgroundColor{
            self.backgroundColor = bgcol
            layer.cornerRadius = 5
            layer.masksToBounds = true
        }
        if hasBorder{
            setGrayRoundedBorders()
        }
    }
    
    public func setIcon(icon: String, tintColor: UIColor = .button){
        setImage(UIImage(systemName: icon)?.withTintColor(tintColor, renderingMode: .alwaysOriginal), for: .normal)
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

