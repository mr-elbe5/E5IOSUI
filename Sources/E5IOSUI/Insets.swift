/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

public struct Insets{
    
    public static var defaultInset : CGFloat = 10
    
    public static var smallInset : CGFloat = 5
    
    public static var defaultInsets : UIEdgeInsets = .init(top: defaultInset, left: defaultInset, bottom: defaultInset, right: defaultInset)
    
    public static var smallInsets : UIEdgeInsets = .init(top: smallInset, left: smallInset, bottom: smallInset, right: smallInset)
    
    public static var halfFlatInsets : UIEdgeInsets = .init(top: smallInset, left: defaultInset, bottom: smallInset, right: defaultInset)
    
    public static var flatInsets : UIEdgeInsets = .init(top: 0, left: defaultInset, bottom: 0, right: defaultInset)
    
    public static var flatWideInsets : UIEdgeInsets = .init(top: 0, left: 2*defaultInset, bottom: 0, right: 2*defaultInset)
    
    public static var narrowInsets : UIEdgeInsets = .init(top: defaultInset, left: 0, bottom: defaultInset, right: 0)
    
    public static var wideInsets : UIEdgeInsets = .init(top: defaultInset, left: 2*defaultInset, bottom: defaultInset, right: 2*defaultInset)
    
    public static var reverseInsets : UIEdgeInsets = .init(top: -defaultInset, left: -defaultInset, bottom: -defaultInset, right: -defaultInset)
    
    public static var doubleInsets : UIEdgeInsets = .init(top: 2 * defaultInset, left: 2 * defaultInset, bottom: 2 * defaultInset, right: 2 * defaultInset)
    
    
}

