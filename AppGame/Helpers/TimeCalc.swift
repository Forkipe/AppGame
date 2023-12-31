//
//  TimeCalc.swift
//  AppGame
//
//  Created by Марк Горкій on 20.07.2023.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    
    if minutes < 60 {
        return "\(minutes) min ago"
    } else if minutes >= 60 && hours < 24 {
        return "\(hours) h ago"
    } else {
        return "\(days) d ago"
    }
}
