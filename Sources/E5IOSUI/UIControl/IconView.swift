/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import Foundation
import UIKit

open class IconView : UIImageView{
    
    public init(icon: String, tintColor: UIColor = .icon, backgroundColor: UIColor? = nil){
        super.init(frame: .zero)
        self.image = UIImage(systemName: icon)
        self.tintColor = tintColor
        self.scaleBy(1.25)
        if let bgcol = backgroundColor{
            self.backgroundColor = bgcol
            layer.cornerRadius = 5
            layer.masksToBounds = true
        }
    }
    
    public init(image: String, tintColor: UIColor = .icon, backgroundColor: UIColor? = nil){
        super.init(frame: .zero)
        self.image = UIImage(named: image)
        self.tintColor = tintColor
        if let bgcol = backgroundColor{
            self.backgroundColor = bgcol
            layer.cornerRadius = 5
            layer.masksToBounds = true
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

