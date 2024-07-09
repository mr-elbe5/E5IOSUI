/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UIView{
    
    public func getExtendedIntrinsicContentSize(originalSize: CGSize) -> CGSize{
        let height = originalSize.height + 6
        layer.cornerRadius = height/2
        layer.masksToBounds = true
        return CGSize(width: originalSize.width + 16, height: height)
    }
    
    public func scaleBy(_ factor: CGFloat){
        self.transform = CGAffineTransform(scaleX: factor, y:factor)
    }
    
    public var firstResponder : UIView? {
        guard !isFirstResponder else {
            return self
        }
        for subview in subviews {
            if let view = subview.firstResponder {
                return view
            }
        }
        return nil
    }
    
    

}

