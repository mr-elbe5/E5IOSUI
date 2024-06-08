/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class PopupViewController: UIViewController {
    
    public var headerView : UIView? = nil
    public var titleLabel: UILabel? = nil
    
    public var closeButton = UIButton().asIconButton("xmark", color: .label)
    
    public  init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func loadView() {
        super.loadView()
        view.backgroundColor = .systemGroupedBackground
        let guide = view.safeAreaLayoutGuide
        createHeaderView()
        if let headerView = headerView{
            view.addSubviewWithAnchors(headerView, top: guide.topAnchor, leading: guide.leadingAnchor, trailing: guide.trailingAnchor)
        }
    }
    
    open func createHeaderView(){
        let headerView = UIView()
        setupHeaderView(headerView: headerView)
        self.headerView = headerView
    }
    
    open func setupHeaderView(headerView: UIView){
        headerView.backgroundColor = .systemBackground
        if let title = title{
            let label = UILabel(header: title)
            headerView.addSubviewWithAnchors(label, top: headerView.topAnchor, bottom: headerView.bottomAnchor, insets: defaultInsets)
                .centerX(headerView.centerXAnchor)
            titleLabel = label
        }
        headerView.addSubviewWithAnchors(closeButton, top: titleLabel?.bottomAnchor ?? headerView.topAnchor, trailing: headerView.trailingAnchor, bottom: headerView.bottomAnchor, insets: defaultInsets)
        closeButton.addAction(UIAction(){ action in
            self.dismiss(animated: true)
        }, for: .touchDown)
    }
    
}
