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
    private let disposeBag = DisposeBag()
    
    init(fetcher: WeatherApiFetcher) {
        self.fetcher = fetcher
    }
    
    func fetch(areaCode: Int) -> Observable<WeatherInformation> {
        let subject = PublishSubject<WeatherInformation>()
        
        fetcher.fetch(areaCode: areaCode).subscribe(onNext: { json in
            subject.onNext(WeatherInformation.from(json: json))
            subject.onCompleted()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        return subject
    }
}
