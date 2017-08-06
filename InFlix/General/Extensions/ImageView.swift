//
//  ImageView.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/21/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView{
    func loadImageUsingCacheWith(urlString: String){
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString){
            
            self.image = cachedImage
            
        }else{
            
            getImageFromUrl(urlString)
            
        }
    }
    
    fileprivate func getImageFromUrl(_ urlString: String){
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let error = error{
                print("Error while trying to get the image. \(error.localizedDescription)")
            }else{
                
                OperationQueue.main.addOperation {
                    if let data = data{
                        
                        if let downloadedImage = UIImage(data: data){
                            imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                            self.image = downloadedImage
                        }
                        
                    }
                }
                
            }
            
        }.resume()
    }
}
