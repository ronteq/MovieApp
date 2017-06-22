//
//  MovieCell.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/21/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell{
    
    fileprivate lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = ColorPalette.defaultGray
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: Constants.Fonts.fontStyleForTitleCells, size: CGFloat(Constants.Fonts.fontSizeForNormalCells))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.font = UIFont(name: Constants.Fonts.fontStyleForNormalCells, size: CGFloat(Constants.Fonts.fontSizeForDetailCells))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var releaseYearLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.font = UIFont(name: Constants.Fonts.fontStyleForNormalCells, size: CGFloat(Constants.Fonts.fontSizeForDetailCells))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movie: Movie? {
        didSet{
            guard let title = movie?.title, let category = movie?.category, let releaseYear = movie?.releaseYear, let posterUrl = movie?.posterUrl else{
                return
            }
            
            movieTitleLabel.text = title
            categoryLabel.text = "Category: \(category)"
            releaseYearLabel.text = "Release Year: \(releaseYear)"
            movieImageView.loadImageUsingCacheWith(urlString: posterUrl)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupViews(){
        addSubview(movieImageView)
        addSubview(movieTitleLabel)
        addSubview(categoryLabel)
        addSubview(releaseYearLabel)
        
        movieImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        movieImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        movieTitleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        categoryLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        releaseYearLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8).isActive = true
        releaseYearLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        releaseYearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
}
