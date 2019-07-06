//
//  TableViewForecastCell.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 04/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import UIKit

class TableViewForecastCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let collectionViewIdentifier = "CollectionViewCell"
    
    var myForecasts = [Forecast]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionViewProcess(forecasts: [Forecast]) {
        self.myForecasts = forecasts
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if myForecasts.count >= 7  {
            return 7
        }
        return myForecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let forecast = myForecasts[indexPath.item]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewIdentifier, for: indexPath) as? myCollectionViewCell {
            cell.processCollectionViewCell(forecast: forecast)
            return cell
        }
        return UICollectionViewCell()
    }
    
    //  car nous avons le flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 150)
    }

    
}
