//
//  FetchWeatherUsecase.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation
import RxSwift

protocol FetchWeatherUseCase {
    // 雑コメント
    // areaCodeをenumにして、Enumの勉強にしてみるといいかも
    // 一度の値受け取りであれば、ObservableよりもSingleの方がいいかも
    func fetch(areaCode: Int) -> Observable<WeatherInformation> 
}
