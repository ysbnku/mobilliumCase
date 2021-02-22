//
//  ViewController.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//

import UIKit

class ListViewController: UIViewController {
    
    var searchBar = UISearchBar()
    private var movie:[Results] = []
    let vc = SearchViewController()
    var topBarHeight = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .black
        searchBar.placeholder = "Aramak istediğiniz filmi girebilirsiniz"
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.returnKeyType = .done
        self.navigationItem.titleView = searchBar
        
        topBarHeight = Int(UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.height ?? 0.0))
        let width = view.frame.width
        let height = view.frame.height
   
        let sliderView = SliderView()
        sliderView.frame = .init(x: 0, y: CGFloat(topBarHeight) , width: width, height: height / 3)
        sliderView.rootVC = self
        sliderView.initCollectionView()
        view.addSubview(sliderView)
        NetworkManager.shared.fetchMovie(service: .nowPlaying, page: 1) { response in
            sliderView.initData(data: response)
        }
        
        let upComingView = UpComingView()
        upComingView.frame = .init(x: 0, y: sliderView.frame.maxY, width: width, height: ( height - height / 3 ) - CGFloat(topBarHeight) )
        upComingView.rootVC = self
        upComingView.initTableView()
        view.addSubview(upComingView)
        NetworkManager.shared.fetchMovie(service: .upComing, page: 1) { response in
            upComingView.initData(data: response)
        }
    }
}

extension ListViewController: UISearchBarDelegate,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.count > 1){
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            vc.query = searchText
            vc.topBarHeight = self.topBarHeight
            vc.search()
            self.addChild(vc)
            self.view.addSubview(vc.view)
            self.didMove(toParent: parent)
        }
        if searchText == "" {
            searchBar.endEditing(true)
        }


    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
        searchBar.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
        searchBar.endEditing(true)
        searchBar.text = ""

    }
    
    
}
