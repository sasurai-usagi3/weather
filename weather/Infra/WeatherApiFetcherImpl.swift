//
//  WeatherApiFetcherImpl.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation
import RxSwift

class WeatherApiFetcherImpl: WeatherApiFetcher {
    func fetch(areaCode: Int) -> Observable<JsonWeather> {
        let subject = PublishSubject<JsonWeather>()
        let session = URLSession.shared
        let url = URL(string: "http://weather.livedoor.com/forecast/webservice/json/v1?city=\(areaCode)")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        session.dataTask(with: request) { rawData, response, error in
            if let data = rawData {
                let decoder = JSONDecoder()
                let json = try! decoder.decode(JsonWeather.self, from: data)
                
                subject.onNext(json)
                subject.onCompleted()
                return
            }
            
            subject.onError(NoDataError())
        }.resume()
        
        return subject
    }
}
