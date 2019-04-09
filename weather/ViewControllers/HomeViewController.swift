//
//  HomeViewController.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/05.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    @IBOutlet var labelArea: UILabel!
    @IBOutlet var tableForecast: UITableView!
    
    private let disposeBag = DisposeBag()
    private var fetcher: WeatherApiFetcher?
    private var usecase: FetchWeatherUseCase?
    private var presenter: HomePresenter?
    
    var areaCode: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetcher = WeatherApiFetcherImpl()
        self.usecase = FetchWeatherUseCaseImpl(fetcher: self.fetcher!)
        self.presenter = HomePresenter(usecase: self.usecase!)
        
        self.tableForecast.register(UINib(nibName: "WeatherForecastListItem", bundle: nil), forCellReuseIdentifier: "WeatherForecastListItem")
        self.tableForecast.dataSource = self.presenter
        self.tableForecast.delegate = self.presenter
        
        self.presenter?.fetch(areaCode: areaCode).subscribe(onNext: { [unowned self] weatherInformation in
            self.labelArea.text = "\(weatherInformation.location)の直近のお天気"
            self.presenter?.forecasts = weatherInformation.forecasts
            self.tableForecast.reloadData()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
}

