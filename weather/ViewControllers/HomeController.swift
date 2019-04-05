//
//  ViewController.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import UIKit
import RxSwift

class HomeController: UIViewController {
    private let disposeBag = DisposeBag()
    private var fetcher: WeatherApiFetcher?
    private var usecase: FetchWeatherUseCase?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.fetcher = WeatherApiFetcherImpl()
        self.usecase = FetchWeatherUseCaseImpl(fetcher: self.fetcher!)
        
        self.usecase?.fetch(areaCode: 101).subscribe(onNext: { weatherInformation in
            print(weatherInformation)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }


}

