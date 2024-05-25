/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UIView{
    
    public var highPriority : Float{
        900
    }
    
    public var midPriority : Float{
        500
    }
    
    public var lowPriority : Float{
        300
    }
    
    public static var defaultPriority : Float{
        900
    }
    
    public func resetConstraints(){
        for constraint in constraints{
            constraint.isActive = false
        }
    }
    
    public func fillView(view: UIView, insets: UIEdgeInsets = .zero){
        setAnchors(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, insets: insets)
    }
    
    public func fillSafeAreaOf(view: UIView, insets: UIEdgeInsets = .zero){
        setAnchors(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, insets: insets)
    }
    
    @discardableResult
    public func setAnchors(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, insets: UIEdgeInsets = .zero) -> UIView{
        translatesAutoresizingMaskIntoConstraints = false
        return self.top(top, inset: insets.top)
            .leading(leading, inset: insets.left)
            .trailing(trailing, inset: -insets.right)
            .bottom(bottom, inset: -insets.bottom)
    }

    @discardableResult
    public func setAnchors(centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil) -> UIView{
        translatesAutoresizingMaskIntoConstraints = false
        return self.centerX(centerX)
            .centerY(centerY)
    }
    
    @discardableResult
    public func top(_ top: NSLayoutYAxisAnchor?, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        if let top = top{
            let constraint = topAnchor.constraint(equalTo: top, constant: inset)
            if priority != UIView.defaultPriority{
                constraint.priority = UILayoutPriority(priority)
            }
            constraint.isActive = true
        }
        return self
    }
    
    @discardableResult
    public func leading(_ leading: NSLayoutXAxisAnchor?, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        if let leading = leading{
            let constraint = leadingAnchor.constraint(equalTo: leading, constant: inset)
            if priority != UIView.defaultPriority{
                constraint.priority = UILayoutPriority(priority)
            }
            constraint.isActive = true
        }
        return self
    }
    
    @discardableResult
    public func trailing(_ trailing: NSLayoutXAxisAnchor?, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        if let trailing = trailing{
            let constraint = trailingAnchor.constraint(equalTo: trailing, constant: inset)
            if priority != UIView.defaultPriority{
                constraint.priority = UILayoutPriority(priority)
            }
            constraint.isActive = true
        }
        return self
    }
    
    @discardableResult
    public func bottom(_ bottom: NSLayoutYAxisAnchor?, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        if let bottom = bottom{
            let constraint = bottomAnchor.constraint(equalTo: bottom, constant: inset)
            if priority != UIView.defaultPriority{
                constraint.priority = UILayoutPriority(priority)
            }
            constraint.isActive = true
        }
        return self
    }
    
    @discardableResult
    public func centerX(_ centerX: NSLayoutXAxisAnchor?, priority: Float = defaultPriority) -> UIView{
        if let centerX = centerX{
            let constraint = centerXAnchor.constraint(equalTo: centerX)
            if priority != UIView.defaultPriority{
                constraint.priority = UILayoutPriority(priority)
            }
            constraint.isActive = true
        }
        return self
    }
    
    @discardableResult
    public func centerY(_ centerY: NSLayoutYAxisAnchor?, priority: Float = defaultPriority) -> UIView{
        if let centerY = centerY{
            let constraint = centerYAnchor.constraint(equalTo: centerY)
            if priority != UIView.defaultPriority{
                constraint.priority = UILayoutPriority(priority)
            }
            constraint.isActive = true
        }
        return self
    }
    
    @discardableResult
    public func width(_ width: CGFloat, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        let constraint = widthAnchor.constraint(equalToConstant: width)
        if priority != UIView.defaultPriority{
            constraint.priority = UILayoutPriority(priority)
        }
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func width(_ anchor: NSLayoutDimension, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        let constraint = widthAnchor.constraint(equalTo: anchor, constant: inset)
        if priority != UIView.defaultPriority{
            constraint.priority = UILayoutPriority(priority)
        }
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func width(_ anchor: NSLayoutDimension, percentage: CGFloat, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: percentage, constant: inset)
        if priority != UIView.defaultPriority{
            constraint.priority = UILayoutPriority(priority)
        }
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func height(_ height: CGFloat, priority: Float = defaultPriority) -> UIView{
        let constraint = heightAnchor.constraint(equalToConstant: height)
        if priority != UIView.defaultPriority{
            constraint.priority = UILayoutPriority(priority)
        }
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func height(_ anchor: NSLayoutDimension, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        let constraint = heightAnchor.constraint(equalTo: anchor, constant: inset)
        if priority != UIView.defaultPriority{
            constraint.priority = UILayoutPriority(priority)
        }
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func height(_ anchor: NSLayoutDimension, percentage: CGFloat, inset: CGFloat = 0, priority: Float = defaultPriority) -> UIView{
        let constraint = heightAnchor.constraint(equalTo: anchor, multiplier: percentage, constant: inset)
        if priority != UIView.defaultPriority{
            constraint.priority = UILayoutPriority(priority)
        }
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func removeAllConstraints() -> UIView{
        for constraint in self.constraints{
            removeConstraint(constraint)
        }
        return self
    }
    
}

