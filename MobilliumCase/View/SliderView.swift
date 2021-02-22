//
//  SliderView.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//

import UIKit
import Kingfisher

class SliderView: UIView,UICollectionViewDelegateFlowLayout {
    
    public var rootVC:UIViewController?
    private var sliderCollectionView: UICollectionView?
    private let identifier = "SliderCell"
    private var movie : [Results] = []

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func initData(data:Results){
        self.movie.append(data)
        self.sliderCollectionView?.reloadData()
    }
    func initCollectionView(){

        let witdh = frame.width
        let height = frame.height
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        self.sliderCollectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: witdh, height: height), collectionViewLayout: flowLayout)
        sliderCollectionView?.collectionViewLayout = flowLayout
        sliderCollectionView?.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        sliderCollectionView?.delegate = self
        sliderCollectionView?.dataSource = self
        sliderCollectionView?.isPagingEnabled = true
        sliderCollectionView?.isScrollEnabled = true
        addSubview(sliderCollectionView!)
        sliderCollectionView?.register(SliderCell.self, forCellWithReuseIdentifier: self.identifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SliderView : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as! SliderCell
        cell.configure(data: self.movie[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movieId = movie[indexPath.row].id
        self.rootVC?.present(movieDetailVC, animated: true, completion: nil)
    }
        
}

class SliderCell:UICollectionViewCell {
    
    var img = UIImageView()
    var title = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        img.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        addSubview(img)
        
        title.frame = CGRect(x: 20, y: img.frame.maxY - 80, width: frame.width - 40, height: 60)
        title.font = UIFont.boldSystemFont(ofSize: 19)
        addSubview(title)
    }
    func configure(data:Results){
        let imgUrlString = "https://image.tmdb.org/t/p/w500\(data.backdrop_path ?? "Placeholderimage")"
        let imgUrl = URL(string: imgUrlString)
        img.kf.setImage(with: imgUrl)
        title.text = data.original_title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
