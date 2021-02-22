//
//  DetailView.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 22.02.2021.
//

import UIKit
import Kingfisher

class DetailView: UIView {
    public var data:Results?

    private var image = UIImageView()
    private let title = UILabel()
    private var overview = UILabel()
    private var star = UIImageView()
    private var starRate = UILabel()
    private var imdbBtn = UIButton()
    private var date = UILabel()
    public var rootVC:UIViewController?
    let similiarView = SimiliarView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    
    }

    func initDetailView(){
        let imgUrlString = "https://image.tmdb.org/t/p/w500\(data?.backdrop_path ?? "Placeholderimage")"
        let imgUrl = URL(string: imgUrlString)
        image.kf.setImage(with: imgUrl)
        image.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 3)
        addSubview(image)
        
        title.frame = CGRect(x: 20, y: (image.frame.maxY) + 10, width: frame.width - 40, height: 0)
        title.text = data?.original_title
        title.font = .boldSystemFont(ofSize: 18)
        title.lineBreakMode = .byWordWrapping
        title.textColor = .black
        title.numberOfLines = 0
        title.sizeToFit()
        addSubview(title)
        
        overview.frame = CGRect(x: 20, y: (title.frame.maxY) + 10, width: frame.width - 40, height: 0)
        overview.text = data?.overview
        overview.font = .systemFont(ofSize: 15)
        overview.lineBreakMode = .byWordWrapping
        overview.numberOfLines = 0
        overview.textColor = .black
        overview.sizeToFit()
        addSubview(overview)
        
    

        imdbBtn.frame = CGRect(x: frame.width - 80, y: (overview.frame.maxY) + 10, width: 45, height: 25)
        imdbBtn.setImage(UIImage(named: "imdb"), for: .normal)
        imdbBtn.addTarget(self, action: #selector(imdbBtnTouch), for:.touchUpInside)
        addSubview(imdbBtn)

        
        date.frame = CGRect(x: imdbBtn.frame.minX - 100, y: (overview.frame.maxY) + 10, width: 100, height: 25)
        date.text = data?.release_date
        date.numberOfLines = 0
        date.textColor = .gray
        addSubview(date)
        
        starRate.frame = CGRect(x: date.frame.minX - 25 , y: (overview.frame.maxY) + 10, width: 20, height: 25)
        starRate.text = String(data?.vote_average ?? 0)
        starRate.numberOfLines = 0
        starRate.textColor = .gray
        addSubview(starRate)
        
        star.frame = CGRect(x: starRate.frame.minX - 30, y: (overview.frame.maxY) + 10, width: 20, height: 20)
        star.image = UIImage(named: "star")
        addSubview(star)
        
        similiarView.frame = CGRect(x: 0, y: star.frame.maxY + 10, width: frame.width, height: 170)
        similiarView.rootVC = rootVC
        similiarView.initCollectionView()
        addSubview(similiarView)

        
    }
    @objc func imdbBtnTouch(sender:UIButton){
        let imdbUrl = "https://www.imdb.com/title/" + (self.data?.imdb_id ?? "www.imdb.com")
        UIApplication.shared.openURL(URL(string: imdbUrl)!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
