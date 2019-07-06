//
//  ImgDownloader.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 04/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import Foundation
import UIKit

class ImgDownloader {
    
    static let load = ImgDownloader()
    
    func imgFrom(stringIcon: String, imgView: UIImageView) {
        
        if let url = URL(string: IMG_URL + stringIcon + IMG_EXT) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                guard data != nil, let img = UIImage(data: data!) else { return }
                DispatchQueue.main.async {
                    imgView.image = img
                }
            }
            task.resume()
        }
    }
}
