//
//  JsonWeather.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation

struct JsonWeather: Codable {
    let pinpointLocations: [JsonWeatherPinpointLocation]
    let link: String
    let forecasts: [JsonWeatherForecast]
    let location: JsonWeatherLocation
    let publicTime: String
    let copyright: JsonWeatherCopyright
    let title: String
    let description: JsonWeatherDescription
    
    struct JsonWeatherPinpointLocation: Codable {
        let link: String
        let name: String
    }
    
    struct JsonWeatherForecast: Codable {
        let dateLabel: String
        let telop: String
        let date: String
        let temperature: JsonWeatherForecastTemperature
        let image: JsonWeatherForecastImage
        
        struct JsonWeatherForecastImage: Codable {
            let width: Int
            let url: String
            let title: String
            let height: Int
        }
        
        struct JsonWeatherForecastTemperature: Codable {
            let min: JsonWeatherForecastTemperatureValues?
            let max: JsonWeatherForecastTemperatureValues?
            
            struct JsonWeatherForecastTemperatureValues: Codable {
                let celsius: String
                let fahrenheit: String
            }
        }
    }

    struct JsonWeatherLocation: Codable {
        let city: String
        let area: String
        let prefecture: String
    }
    
    struct JsonWeatherCopyright: Codable {
        let provider: [JsonWeatherCopyrightProvider]
        let link: String
        let title: String
        let image: JsonWeatherCopyrightImage
        
        struct JsonWeatherCopyrightProvider: Codable {
            let link: String
            let name: String
        }
        
        struct JsonWeatherCopyrightImage: Codable {
            let width: Int
            let url: String
            let link: String
            let title: String
            let height: Int
        }
    }
    
    
    
    struct JsonWeatherDescription: Codable {
        let text: String
        let publicTime: String
    }
}
