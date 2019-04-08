//
//  AreaIndexViewController.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/08.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import UIKit

class AreaIndexViewController: UIViewController {
    @IBOutlet var tableAreas: UITableView!
    private let presenter = AreaIndexPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableAreas.register(UINib(nibName: "AreaListItem", bundle: nil), forCellReuseIdentifier: "AreaListItem")
        tableAreas.dataSource = presenter
        tableAreas.delegate = presenter
    }
}
