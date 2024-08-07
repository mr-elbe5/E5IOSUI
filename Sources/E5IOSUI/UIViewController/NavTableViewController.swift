/*
 Maps For OSM
 App for display and use of OSM maps without MapKit
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class NavTableViewController: NavViewController {
    
    public var subheaderView : UIView? = nil
    public var tableView = UITableView()
    
    override open func loadSubviews(guide: UILayoutGuide) {
        var topAnchor = guide.topAnchor
        if let subheaderView = subheaderView{
            view.addSubviewWithAnchors(subheaderView, top: topAnchor, leading: guide.leadingAnchor, trailing: guide.trailingAnchor, insets: defaultInsets)
            topAnchor = subheaderView.bottomAnchor
        }
        tableView.backgroundColor = .systemBackground
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
        subheaderView.backgroundColor = .tertiarySystemBackground
        subheaderView.setRoundedEdges()
    }
    
    open func setNeedsUpdate(){
        tableView.reloadData()
    }
    
}
