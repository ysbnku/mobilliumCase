//
//  ViewController.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//

import UIKit

class SearchViewController: UIViewController {
    private var movie:[Results] = []
    let searchView = SearchView()
    var updateViewFrame = 0
    var topBarHeight:Int = 0
    var query:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        


    }
    
    func search(){
        
        let width = view.frame.width
        let height = view.frame.height
        searchView.frame = .init(x: 0, y: CGFloat(topBarHeight) , width: width, height: height - CGFloat(topBarHeight) )
        searchView.rootVC = self
        searchView.initTableView()
        view.addSubview(searchView)
        NetworkManager.shared.fetchSearchedMovie(service: .search, query: query) { response in
            self.searchView.initData(data: response)
        }
    }


}


