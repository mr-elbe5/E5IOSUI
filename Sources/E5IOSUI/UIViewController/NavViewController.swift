/*
 Maps For OSM
 App for display and use of OSM maps without MapKit
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class NavViewController: UIViewController {
    
    public init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .label
        if let title = self.title{
            self.navigationItem.titleView = UILabel(text: title)
        }
        let guide = view.safeAreaLayoutGuide
        loadSubviews(guide: guide)
        updateNavigationItems()
    }
    
    open func loadSubviews(guide: UILayoutGuide) {
    }
    
    open func updateNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), primaryAction: UIAction(){ action in
            self.close()
        })
    }
    
    open func close(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
