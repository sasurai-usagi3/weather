//
//  FetchWeatherUseCase.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation
import RxSwift

class FetchWeatherUseCaseImpl: FetchWeatherUseCase {
    private let fetcher: WeatherApiFetcher
    
    init(fetcher: WeatherApiFetcher) {
        self.fetcher = fetcher
    }
    
    func fetch(area: Area) -> Single<WeatherInformation> {
        return fetcher.fetch(areaCode: area.rawValue).map { json in
            WeatherInformation.from(json: json)
        }
    }
}
