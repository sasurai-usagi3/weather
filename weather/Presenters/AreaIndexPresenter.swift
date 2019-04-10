//
//  AreaIndexPresenter.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/08.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import UIKit
import RxSwift

// ViewController -> Viewの表示ロジック
// Presenter -> Viewの表示内容とかのプレゼンテーションロジック
// で分けることが多いかも。

class AreaIndexPresenter: NSObject {
    private let translateViewEventStream = PublishSubject<Area>()
    lazy var translateViewEventHandler: Observable<Area> = {
        return self.translateViewEventStream
    }()
    private let areas: [Area] = [
        .TOKYO,
        .OHSHIMA,
        .HACHIJOJIMA,
        .CHICHIJIMA,
        .YOKOHAMA,
        .ODAWARA
    ]
}

// PresenterへのDelegate実装は、UITableViewっていうOS的なView実装を多くしってなきゃいけないから
// Viewへの表示という形で、もっと依存度をさげて書いたほうが良いかも
extension AreaIndexPresenter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let area = areas[index]
        
        translateViewEventStream.onNext(area)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AreaListItem") as! AreaListItem
        let index = indexPath.row
        let area = areas[index]
        
        cell.labelArea.text = area.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: 50)
    }
}
