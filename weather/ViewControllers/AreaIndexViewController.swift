//
//  AreaIndexViewController.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/08.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import UIKit
import RxSwift

class AreaIndexViewController: UIViewController {
    @IBOutlet private weak var tableAreas: UITableView!
    private let presenter = AreaIndexPresenter()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableAreas.register(UINib(nibName: "AreaListItem", bundle: nil), forCellReuseIdentifier: "AreaListItem")
        tableAreas.dataSource = presenter
        tableAreas.delegate = presenter
        
        presenter.translateViewEventHandler.subscribe(onNext: { [unowned self] areaCode in
            self.performSegue(withIdentifier: "areaIndexToWeatherForecastSegue", sender: areaCode)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HomeViewController
        let areaCode = sender as! Int
        
        vc.areaCode = areaCode
    }
}
