//
//  SearchCell.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/20/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell{
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var searchTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: Constants.Fonts.fontStyleForNormalCells, size: CGFloat(Constants.Fonts.fontSizeForTitleCells))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        setupViews()
    }
    
    private func setupViews(){
        addSubview(iconImageView)
        addSubview(searchTextLabel)
        
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        searchTextLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 24).isActive = true
        searchTextLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor).isActive = true
    }
}
