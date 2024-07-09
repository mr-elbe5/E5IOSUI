/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class PopupTableViewController: PopupViewController {
    
    public var subheaderView : UIView? = nil
    public var tableView = UITableView()
    
    override open func loadView() {
        super.loadView()
        let guide = view.safeAreaLayoutGuide
        var topAnchor = headerView?.bottomAnchor ?? guide.topAnchor
        if let subheaderView = subheaderView{
            view.addSubviewWithAnchors(subheaderView, top: topAnchor, leading: guide.leadingAnchor, trailing: guide.trailingAnchor, insets: .zero)
            topAnchor = subheaderView.bottomAnchor
        }
        view.addSubviewWithAnchors(tableView, top: topAnchor, leading: guide.leadingAnchor, trailing: guide.trailingAnchor, bottom: guide.bottomAnchor, insets: .zero)
        tableView.allowsSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.separatorStyle = .none
    }
    
    open func createSubheaderView(){
        let subheaderView = UIView()
        setupSubheaderView(subheaderView: subheaderView)
        self.subheaderView = subheaderView
    }
    
    open func setupSubheaderView(subheaderView: UIView){
    }
    
    public func setNeedsUpdate(){
        tableView.reloadData()
    }
    
}

