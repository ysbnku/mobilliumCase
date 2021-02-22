//
//  SimiliarView.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//

import UIKit
import Kingfisher

class SimiliarView: UIView,UICollectionViewDelegateFlowLayout {
    
    public var rootVC:UIViewController?
    private var similiarCollectionView: UICollectionView?
    private let identifier = "SimiliarCell"
    private var movie : [Results] = []

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func initData(data:Results){
        self.movie.append(data)
        self.similiarCollectionView?.reloadData()
    }
    func initCollectionView(){
        
        let witdh = frame.width
        let height = frame.height
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        self.similiarCollectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: witdh, height: height), collectionViewLayout: flowLayout)
        similiarCollectionView?.collectionViewLayout = flowLayout
        similiarCollectionView?.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        similiarCollectionView?.delegate = self
        similiarCollectionView?.dataSource = self
        similiarCollectionView?.isPagingEnabled = true
        similiarCollectionView?.isScrollEnabled = true
        addSubview(similiarCollectionView!)
        similiarCollectionView?.register(SimiliarCell.self, forCellWithReuseIdentifier: self.identifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SimiliarView : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as! SimiliarCell
        cell.configure(data: self.movie[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movieId = movie[indexPath.row].id
        self.rootVC?.present(movieDetailVC, animated: true, completion: nil)
    }
        
}

class SimiliarCell:UICollectionViewCell {
    
    var img = UIImageView()
    var title = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        img.frame = CGRect(x: 5, y: 5, width: frame.width - 10, height: frame.height - 70)
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 6
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        addSubview(img)
        
        title.frame = CGRect(x: 5, y: img.frame.maxY + 5, width: frame.width - 10, height: 40)
        title.font = UIFont.boldSystemFont(ofSize: 15)
        title.textColor = .black
        title.numberOfLines = 2
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
