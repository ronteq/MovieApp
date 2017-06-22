//
//  MovieHomeVC.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class MovieHomeVC: UIViewController {
    
    @IBOutlet fileprivate weak var searchTextField: UITextField!
    
    fileprivate var movieCollectionView: UICollectionView!
    fileprivate var movie: Movie?
    fileprivate var movies: [Movie]?
    fileprivate lazy var activityIndicator: ActivityIndicator = {
        let activityIndicator = ActivityIndicator()
        return activityIndicator
    }()
    
    var placeholder: String?
    
    var searchMode: SearchMode = .movie
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    @IBAction func searchMovie(){
        guard let searchText = searchTextField.text, searchText.characters.count > 0 else{
            searchTextField.attributedPlaceholder = createCustomPlaceholder(withMessage: UserMessages.validateEmptyTextFields)
            return
        }
        
        guard let searchTextReadyForAPI = searchText.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else{ return }
        
        fetchMovies(searchText: searchTextReadyForAPI)
    }
    
    fileprivate func fetchMovies(searchText: String){
        movie = nil
        movies = nil
        movieCollectionView.reloadData()
        
        switch searchMode{
        case .movie: fetchMovie(withTitle: searchText)
        case .actor: fetchMovies(withActor: searchText)
        case .director: fetchMovies(withDirector: searchText)
        }
        
    }
    
}

//MARK: -Initial Setup

extension MovieHomeVC{
    
    fileprivate func initialSetup(){
        searchTextField.delegate = self
        
        setupPlaceholderForTextField()
        setupCollectionView()
        addTapGestureToView()
    }
    
    fileprivate func setupPlaceholderForTextField(){
        searchTextField.placeholder = placeholder
    }
    
    fileprivate func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.alwaysBounceVertical = true
        movieCollectionView.backgroundColor = UIColor.clear
        movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: CellId.movieCellId)
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieCollectionView)
        
        addConstraintsToCollectionView()
    }
    
    fileprivate func addConstraintsToCollectionView(){
        movieCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -49).isActive = true
    }
    
    fileprivate func addTapGestureToView(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(MovieHomeVC.dismissKeyboard))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    fileprivate struct UserMessages{
        static let validateEmptyTextFields = "Please fill this for us..."
        static let searchLessThanFiveCharacters = "Sorry! Your input length must be greater than 4"
    }
    
    fileprivate struct CellId{
        static let movieCellId = "movieCellId"
    }
    
    fileprivate struct ScreenSize{
        static let width: CGFloat = UIScreen.main.bounds.width
        static let height: CGFloat = UIScreen.main.bounds.height
    }
}

//MARK: -Textfield Methods

extension MovieHomeVC: UITextFieldDelegate{
    @objc fileprivate func dismissKeyboard(){
        searchTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        
        return true
    }
}

//MARK: -CollectionView Methods

extension MovieHomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = movies?.count{
            
            return count
            
        }else{
            if movie != nil{
                return 1
            }
        }
        
            
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.movieCellId, for: indexPath) as! MovieCell
        
        if let movie = movies?[indexPath.row]{
            
            cell.movie = movie
            
        }else{
            
            if let movie = movie{
                cell.movie = movie
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenSize.width / 2, height: 220)
    }
}

//MARK: -Fetch Movies Methods
extension MovieHomeVC{
    fileprivate func fetchMovie(withTitle title: String){
        activityIndicator.launchInView(view)
        MovieService.fetchMovie(withTitle: title) { (movie, errorMessage) in
            
            OperationQueue.main.addOperation {
                self.activityIndicator.stop()
                if let message = errorMessage{
                    let alert = self.createAlert(withMessage: message)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.movie = movie
                    self.movieCollectionView.reloadData()
                }
            }
            
        }
    }
    
    fileprivate func fetchMovies(withActor actor: String){
        activityIndicator.launchInView(view)
        MovieService.fetchMovies(withActor: actor) { (movies, errorMessage) in
            OperationQueue.main.addOperation {
                self.activityIndicator.stop()
                if let message = errorMessage{
                    let alert = self.createAlert(withMessage: message)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.movies = movies
                    self.movieCollectionView.reloadData()
                }
            }
        }
    }
    
    fileprivate func fetchMovies(withDirector director: String){
        activityIndicator.launchInView(view)
        MovieService.fetchMovies(withDirector: director) { (movies, errorMessage) in
            OperationQueue.main.addOperation {
                self.activityIndicator.stop()
                if let message = errorMessage{
                    let alert = self.createAlert(withMessage: message)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.movies = movies
                    self.movieCollectionView.reloadData()
                }
            }
        }
    }
}

//MARK: -Custom Placeholder

extension MovieHomeVC{
    fileprivate func createCustomPlaceholder(withMessage message: String)-> NSAttributedString{
        let placeholder = NSAttributedString(string: message, attributes: [NSForegroundColorAttributeName: ColorPalette.redPlaceholder])
        return placeholder
    }
}
