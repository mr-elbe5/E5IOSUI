/*
 E5IOSUI
 Basic classes and extensions for reuse
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

open class TableViewCell: UITableViewCell{
    
    public var iconView = UIView()
    public var itemView = UIView()
    
    public var cellBody = UIView()
    
    public var iconInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        isUserInteractionEnabled = true
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        cellBody.backgroundColor = .tertiarySystemBackground
        contentView.addSubviewFilling(cellBody, insets: defaultInsets)
        setupCellBody()
        accessoryType = .none
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupCellBody(){
        cellBody.setRoundedBorders()
        cellBody.addSubviewWithAnchors(iconView, top: cellBody.topAnchor, trailing: cellBody.trailingAnchor, insets: smallInsets)
        cellBody.addSubviewWithAnchors(itemView, top: iconView.bottomAnchor, leading: cellBody.leadingAnchor, trailing: cellBody.trailingAnchor, bottom: cellBody.bottomAnchor, insets: .zero)
    }
    
    open func updateCell(){
        updateItemView()
        updateIconView()
    }
    
    open func updateIconView(){
    }
    
    open func updateItemView(){
    }
    
}


