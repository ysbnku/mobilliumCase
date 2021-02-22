//
//  UpComingView.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//

import UIKit

class UpComingView: UIView {

    private var upComingTableView:UITableView?
    private let identifier = "UpComingCell"
    private var movie:[Results] = []
    public var rootVC:UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func initData(data:Results){
        self.movie.append(data)
        self.upComingTableView?.reloadData()
    }
    func initTableView(){
        self.backgroundColor = .white
        let witdh = frame.width
        let height = frame.height
        upComingTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: witdh, height: height))
        upComingTableView?.delegate = self
        upComingTableView?.dataSource = self
        upComingTableView?.backgroundColor = .white
        upComingTableView?.register(UpComingCell.self, forCellReuseIdentifier: identifier)
        self.addSubview(upComingTableView!)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension UpComingView:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! UpComingCell
        cell.configure(data: movie[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movieId = movie[indexPath.row].id
        self.rootVC?.present(movieDetailVC, animated: true, completion: nil)
    }
    
    
}

class UpComingCell : UITableViewCell {
    
    let posterImage = UIImageView()
    var title = UILabel()
    var release_date = UILabel()
    var overview = UILabel()
    var forwardImage = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.separatorInset = .zero
        self.layoutMargins = .zero
        self.selectionStyle = .none
        let witdh = UIScreen.main.bounds.size.width
        
        posterImage.frame = .init(x: 10, y: 15, width: 110, height: 110)
        posterImage.contentMode = .scaleAspectFill
        posterImage.layer.cornerRadius = 6
        posterImage.layer.masksToBounds = true
        posterImage.clipsToBounds = true
        addSubview(posterImage)

        title.frame = .init(x: 130, y: 15, width: witdh - 170, height: 20)
        title.textColor = .black
        title.numberOfLines = 1
        title.font = .boldSystemFont(ofSize: 16)
        addSubview(title)
        
        overview.frame = .init(x: 130, y: 33, width: witdh - 170, height: 70)
        overview.textColor = .black
        overview.lineBreakMode = .byWordWrapping
        overview.numberOfLines = 3
        overview.font = .systemFont(ofSize: 14)
        addSubview(overview)
        
        release_date.frame = .init(x: witdh - 100 , y: 100, width: witdh - 170, height: 20)
        release_date.textColor = .black
        addSubview(release_date)
        
        forwardImage.frame = .init(x: witdh - 40 , y: 65, width: 20, height: 20)
        forwardImage.image = UIImage(named: "right")
        addSubview(forwardImage)
        
        
    }
    
    func configure (data:Results) {
        let imgUrlString = "https://image.tmdb.org/t/p/w500\(data.backdrop_path ?? "Placeholderimage")"
        let imgUrl = URL(string: imgUrlString)
        posterImage.kf.setImage(with: imgUrl)
        title.text = data.original_title
        overview.text = data.overview
        release_date.text = data.release_date
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
