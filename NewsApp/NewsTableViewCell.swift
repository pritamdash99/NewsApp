//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Pritam Dash on 24/06/22.
//

import UIKit

class NewsTableViewCellViewModel {
    let title : String
    let subtitle : String
    let imageURL : URL?
    let imageData : Data? = nil
    
    init(title :String , subtitle : String , imageURL : URL?){
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
}

class NewsTableViewCell: UITableViewCell {

    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    private let subtitleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let newsImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(newsImageView)
    }
    
    required init(coder : NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel : NewsTableViewCellViewModel){
        newsTitleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        //Image
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        }else {
            //fetch
        }
    }

}
