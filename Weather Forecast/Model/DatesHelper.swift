//
//  DatesHelper.swift
//  Weather Forecast
//
//  Created by Saliou DJALO on 05/07/2019.
//  Copyright © 2019 Saliou DJALO. All rights reserved.
//

import Foundation
import UIKit

class DateHelper {
    static let load = DateHelper()
    
    // convert a string to a date
    func toDate(_ stringDate: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // format de la date renvoyee
        if let date = formatter.date(from: stringDate) {
            return date
        } else {
            return nil
            
        }
    }
    
    func dayOfWeek(stringValue: String) -> String? {
        
        if let date = toDate(stringValue) {
            let calendar = Calendar.current
            if calendar.isDateInToday(date) {
                return "Auj"
            } else if calendar.isDateInTomorrow(date) {
                return "Demain"
            } else {
                // extrement pratique cette fonction,
                // me permet de recupere quel jour il sagit a partir dune date
                let day = calendar.component(.weekday, from: date)
                switch day {
                case 1: return "Dimanche"
                case 2: return "Lundi"
                case 3: return "Mardi"
                case 4: return "Mercredi"
                case 5: return "Jeudi"
                case 6: return "Vendredi"
                default: return "Samedi"
                }
                
            }
        }
        return nil
    }
    
    func getHour(_ stringDate: String) -> String? {
        
        if let date = toDate(stringDate) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: date)
        } else {
            return nil
        }
    }
    
    func getDay(date:Date) -> String? {
        let calendar = Calendar.current
        
        let day = calendar.component(.weekday, from: date)
        switch day {
        case 1: return "Dimanche"
        case 2: return "Lundi"
        case 3: return "Mardi"
        case 4: return "Mercredi"
        case 5: return "Jeudi"
        case 6: return "Vendredi"
        case 7: return "Samedi"
        default: return nil
        }
    }
    
    func getShortDayName(stringDay: String) -> String? {
        
        switch stringDay {
        case "Dimanche" : return "Dim"
        case "Lundi" : return "Lun"
        case "Mardi" : return "Mar"
        case "Mercredi" : return "Mer"
        case "Jeudi" : return "Jeu"
        case "Vendredi" : return "Ven"
        case "Samedi" : return "Sam"
        case "Auj": return "Auj"
        case "Demain": return "Dem"
        default: return nil
        }
    }
    
    
}
