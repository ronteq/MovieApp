//
//  MovieDetailVC.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/22/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    fileprivate lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = ColorPalette.defaultGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.fontStyleForTitleCells, size: Constants.Fonts.fontSizeForTitleCells)
        label.numberOfLines = 2
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.fontStyleForNormalCells, size: Constants.Fonts.fontSizeForNormalCells)
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var directorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.fontStyleForNormalCells, size: Constants.Fonts.fontSizeForNormalCells)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.fontStyleForNormalCells, size: Constants.Fonts.fontSizeForNormalCells)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var releaseYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.fontStyleForTitleCells, size: Constants.Fonts.fontSizeForNormalCells)
        label.textColor = UIColor.darkGray
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var runtimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.fontStyleForTitleCells, size: Constants.Fonts.fontSizeForNormalCells)
        label.textColor = UIColor.darkGray
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = ColorPalette.defaultRed
        button.setTitle("SAVE TO FAVORITES", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var movie: Movie?{
        didSet{
            guard let title = movie?.title, let releaseYear = movie?.releaseYear, let category = movie?.category, let director = movie?.director, let summary = movie?.summary, let posterUrl = movie?.posterUrl, let runtime = movie?.runtime else { return }
            
            posterImageView.loadImageUsingCacheWith(urlString: posterUrl)
            titleLabel.text = title
            summaryLabel.text = summary
            directorLabel.text = "Director: \(director)"
            categoryLabel.text = category
            releaseYearLabel.text = releaseYear
            runtimeLabel.text = runtime
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
}

extension MovieDetailVC{
    fileprivate func initialSetup(){
        setupViews()
        addConstraintsToViews()
    }
    
    fileprivate func setupViews(){
        view.backgroundColor = UIColor.white
        view.addSubview(posterImageView)
        view.addSubview(titleLabel)
        view.addSubview(summaryLabel)
        view.addSubview(saveButton)
        
        createStackviewsForDetailInfo()
    }
    
    fileprivate func createStackviewsForDetailInfo(){
        let leftStackview = UIStackView(arrangedSubviews: [directorLabel, categoryLabel])
        leftStackview.axis = .vertical
        leftStackview.spacing = 8
        leftStackview.spacing = 8
        leftStackview.distribution = .fillEqually
        leftStackview.alignment = .fill
        
        let rightStackview = UIStackView(arrangedSubviews: [releaseYearLabel, runtimeLabel])
        rightStackview.axis = .vertical
        rightStackview.spacing = 8
        rightStackview.distribution = .fillEqually
        rightStackview.alignment = .fill
        
        let finalStackview = UIStackView(arrangedSubviews: [leftStackview, rightStackview])
        finalStackview.translatesAutoresizingMaskIntoConstraints = false
        finalStackview.axis = .horizontal
        finalStackview.distribution = .fillProportionally
        finalStackview.alignment = .fill
        view.addSubview(finalStackview)
        
        addConstraintsToStackview(finalStackview)
    }
    
    fileprivate func addConstraintsToViews(){
        posterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: Constants.ScreenSize.height / 2 - 80).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        summaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        summaryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    fileprivate func addConstraintsToStackview(_ stackview: UIStackView){
        stackview.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 16).isActive = true
        stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
