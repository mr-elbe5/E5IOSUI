/*
 Maps For OSM
 App for display and use of OSM maps without MapKit
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class NavViewController: UIViewController {
    
    public var darkMode = false
    
    public init(darkMode: Bool = false){
        super.init(nibName: nil, bundle: nil)
        self.darkMode = darkMode
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func loadView() {
        super.loadView()
        if darkMode{
            view.backgroundColor = .black
            self.navigationController?.navigationBar.barStyle = .black
            self.navigationController?.navigationBar.tintColor = .white
        }
        if let title = self.title{
            self.navigationItem.titleView = UILabel(text: title).withTextColor(.white)
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