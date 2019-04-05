//
//  WeatherInfomation.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation

struct WeatherInformation {
    let location: String
    let publishedAt: Date
    let forecasts: [WeatherForecast]
    
    static func from(json: JsonWeather) -> WeatherInformation {
        let formatter = ISO8601DateFormatter()
        let location = "\(json.location.prefecture)\(json.location.city)"
        let publishedAt = formatter.date(from: json.publicTime)!
        let forecasts = json.forecasts.map { forecast in
            WeatherForecast.from(json: forecast)
        }
        
        return WeatherInformation(location: location, publishedAt: publishedAt, forecasts: forecasts)
    }
}
