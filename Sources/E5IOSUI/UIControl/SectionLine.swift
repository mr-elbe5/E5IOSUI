/*
 Construction Defect Tracker
 App for tracking construction defects 
 Copyright: Michael Rönnau mr@elbe5.de 2023
 */

import Foundation
import UIKit

open class SectionLine: UIControl{
    
    public var label: UILabel
    
    public init(name: String, action: UIAction){
        label = UILabel(text: name)
        super.init(frame: .zero)
        setGrayRoundedBorders(radius: 10)
        setBackground(.systemBackground)
        addSubviewAtLeft(label)
        let linkButton = IconButton(icon: "chevron.right", tintColor: .systemBlue)
        linkButton.addAction(action, for: .touchDown)
        addSubviewWithAnchors(linkButton, trailing: trailingAnchor, insets: wideInsets).centerY(centerYAnchor)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

