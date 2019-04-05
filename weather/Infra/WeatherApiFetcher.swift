//
//  WeatherApiFetcher.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation
import RxSwift

protocol WeatherApiFetcher {
    func fetch(areaCode: Int) -> Observable<JsonWeather>
}
