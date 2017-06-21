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
    
    var placeholder: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
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
    
    fileprivate struct AlertMessages{
        static let validateEmptyTextFields = "Please fill at least one of the text fields"
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.movieCellId, for: indexPath) as! MovieCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenSize.width / 2, height: 220)
    }
}

/*
@IBAction func searchMovie(){
    guard let titleStringWithSpaces = movieTextField.text, let actorStringWithSpaces = actorTextField.text, let directorStringWithSpaces = directorTextField.text else{
        return
    }
    
    if titleStringWithSpaces.isEmpty, actorStringWithSpaces.isEmpty, directorStringWithSpaces.isEmpty{
        let alert = GeneralMethods.createAlert(withMessage: AlertMessages.validateEmptyTextFields)
        present(alert, animated: true, completion: nil)
    }else{
        let title = GeneralMethods.prepareStringForUrl(titleStringWithSpaces)
        let actor = GeneralMethods.prepareStringForUrl(actorStringWithSpaces)
        let director = GeneralMethods.prepareStringForUrl(directorStringWithSpaces)
        
        fetchMovies(title: title, actor: actor, director: director)
    }
}

private func fetchMovies(title: String, actor: String, director: String){
    MovieService.getMovies(withTitle: title){ (movie, errorMessage) in
        
        OperationQueue.main.addOperation {
            if let message = errorMessage{
                let alert = GeneralMethods.createAlert(withMessage: message)
                self.present(alert, animated: true, completion: nil)
            }else{
                self.movie = movie
                //                    self.goToMoviesVC()
            }
        }
    }
}

*/
