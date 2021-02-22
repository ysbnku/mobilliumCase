//
//  SearchView.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//

import UIKit

class SearchView: UIView {

    private var searchTableView:UITableView?
    private let identifier = "SearchViewCell"
    private var movie:[Results] = []
    public var rootVC:UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func initData(data:Results){
        self.movie.append(data)
        self.searchTableView?.reloadData()
    }
    func initTableView(){
        movie.removeAll()
        self.backgroundColor = .white
        let witdh = frame.width
        let height = frame.height
        searchTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: witdh, height: height))
        searchTableView?.tableFooterView = UIView()
        searchTableView?.delegate = self
        searchTableView?.dataSource = self
        searchTableView?.backgroundColor = .white
        searchTableView?.register(SearchViewCell.self, forCellReuseIdentifier: identifier)
        self.addSubview(searchTableView!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension SearchView:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! SearchViewCell
        cell.configure(data: movie[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movieId = movie[indexPath.row].id
        self.rootVC?.present(movieDetailVC, animated: true, completion: nil)
    }
    
    
}

class SearchViewCell : UITableViewCell {
    
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
        
        title.frame = .init(x: 10, y: 20, width: witdh, height: 20)
        title.textColor = .black
        title.numberOfLines = 1
        title.font = .boldSystemFont(ofSize: 16)
        addSubview(title)
        
        forwardImage.frame = .init(x: witdh - 40 , y: 20, width: 20, height: 20)
        forwardImage.image = UIImage(named: "right")
        addSubview(forwardImage)
        
        
    }
    
    func configure (data:Results) {
        title.text = data.original_title
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
