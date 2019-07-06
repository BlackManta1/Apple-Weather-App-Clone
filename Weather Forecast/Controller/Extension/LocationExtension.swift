//
//  LocationExtension.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 02/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension WeatherViewController : CLLocationManagerDelegate {
    
    func locationProcessing() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard locations.count > 0 else { return }
        locationManager?.stopUpdatingLocation()
        let currentLocation = locations[0]
        let latitude = currentLocation.coordinate.latitude
        let longitude = currentLocation.coordinate.longitude
        print("Latitude : \(latitude)")
        print("Longitude : \(longitude)")
        // ca evite de charger plusieurs fois a l'API
        if isLoading == false {
            // on reactualise certaine donnee au passage
            fullDayForecasts = [FullDayForecast]()
            forecasts = [Forecast]()
            getCity(myLocation: currentLocation) // fonctionne beaucoup mieux que lAPI qui renvoie un nom de ville chelou
            getWeatherForecast(latitude: latitude, longitude: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
}
