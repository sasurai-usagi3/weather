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
// これでいうと、UIViewControllerを継承してるのが気になってる。。
class AreaIndexPresenter: UIViewController {
    private let translateViewEventStream = PublishSubject<Int>()
    lazy var translateViewEventHandler: Observable<Int> = {
        return self.translateViewEventStream
    }()
    private let areas = [
        Area(name: "東京都東京", areaCode: 130010),
        Area(name: "東京都大島", areaCode: 130020),
        Area(name: "東京都八丈島", areaCode: 130030),
        Area(name: "東京都父島", areaCode: 130040),
        Area(name: "神奈川県横浜", areaCode: 140010),
        Area(name: "神奈川県小田原", areaCode: 140020)
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
        
        translateViewEventStream.onNext(area.areaCode)
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
