//
//  ViewController.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var movieId:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let vertical = UIStackView()
        vertical.frame = view.bounds
        vertical.axis = .vertical
        vertical.alignment = .fill
        vertical.distribution = .fillEqually
        vertical.spacing = 5
        vertical.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(vertical)
        

        
        let detailView = DetailView()
        detailView.frame =  CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        detailView.rootVC = self
        view.addSubview(detailView)
        NetworkManager.shared.fetchMovieDetail(service: .movie, id: String(movieId)) { result in
            detailView.data = result
            detailView.initDetailView()
        }
        
        NetworkManager.shared.fetchMovieSimiliar(service: .movie, id: String(movieId)) { response in
            detailView.similiarView.initData(data: response)
        }
        
        
    }


}

