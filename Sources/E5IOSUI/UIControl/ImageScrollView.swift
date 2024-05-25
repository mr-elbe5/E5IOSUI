/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import Foundation
import UIKit

public protocol TouchDelegate{
    func touched(at relativePosition: CGPoint)
}

open class ImageScrollView: UIScrollView, UIScrollViewDelegate{
    
    public var image: UIImage
    public var imageView: UIImageView
    
    public var touchDelegate: TouchDelegate? = nil
    
    public init(image: UIImage) {
        self.image = image
        imageView = UIImageView(image: image)
        super.init(frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(){
        isScrollEnabled = true
        scrollsToTop = false
        isDirectionalLockEnabled = false
        isPagingEnabled = false
        showsVerticalScrollIndicator = true
        showsHorizontalScrollIndicator = true
        bounces = false
        bouncesZoom = false
        maximumZoomScale = 2.0
        minimumZoomScale = 1.0
        addSubview(imageView)
        contentSize = image.size
        delegate = self
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector (onTouch))
        addGestureRecognizer(gestureRecognizer)
    }
    
    @objc public func onTouch(_ sender: UIGestureRecognizer){
        let point = sender.location(in: imageView)
        touched(pnt: point)
    }
    
    public func touched(pnt: CGPoint){
        touchDelegate?.touched(at: CGPoint(x: pnt.x/image.size.width, y: pnt.y/image.size.height))
    }
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
}
