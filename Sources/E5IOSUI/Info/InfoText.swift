/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import Foundation

import UIKit

open class InfoText : UIView{
    
    let text = UILabel()
    
    public init(text: String, leftInset: CGFloat = 0){
        super.init(frame: .zero)
        self.text.text = text
        self.text.numberOfLines = 0
        self.text.textColor = .text
        addSubviewWithAnchors(self.text, top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, insets: UIEdgeInsets(top: defaultInset, left: leftInset, bottom: defaultInset, right: 0))
    }
    
    public init(key: String, leftInset: CGFloat = 0){
        super.init(frame: .zero)
        self.text.text = key.localize(table: "Info")
        self.text.numberOfLines = 0
        self.text.textColor = .text
        addSubviewWithAnchors(self.text, top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, insets: UIEdgeInsets(top: defaultInset, left: leftInset, bottom: defaultInset, right: 0))
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

