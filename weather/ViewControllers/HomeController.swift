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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchWeatherUseCaseImpl().fetch(areaCode: 101).subscribe(onNext: { weatherInformation in
            print(weatherInformation)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }


}

