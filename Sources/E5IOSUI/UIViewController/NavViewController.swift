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
    
    open func setBlackNavigation(){
        view.setBackground(.black)
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override open func loadView() {
        super.loadView()
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
