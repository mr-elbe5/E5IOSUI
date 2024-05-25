/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UIView{
    
    @discardableResult
    public func addSubviewWithAnchors(_ subview: UIView, top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, insets: UIEdgeInsets = .zero) -> UIView{
        addSubview(subview)
        subview.setAnchors(top: top, leading: leading, trailing: trailing, bottom: bottom, insets: insets)
        return subview
    }
    
    @discardableResult
    public func addSubviewCentered(_ subview: UIView, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil) -> UIView{
        addSubview(subview)
        subview.setAnchors(centerX: centerX,centerY: centerY)
        return subview
    }
    
    @discardableResult
    public func addSubviewFilling(_ subview: UIView, insets: UIEdgeInsets = .zero) -> UIView{
        addSubview(subview)
        subview.fillView(view: self, insets: insets)
        return subview
    }
    
    @discardableResult
    public func addSubviewFillingSafeArea(_ subview: UIView, insets: UIEdgeInsets = .zero) -> UIView{
        addSubview(subview)
        subview.fillSafeAreaOf(view: self, insets: insets)
        return subview
    }
    
    public func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    public func removeSubview(_ view : UIView) {
        for subview in subviews {
            if subview == view{
                subview.removeFromSuperview()
                break
            }
        }
    }

}

