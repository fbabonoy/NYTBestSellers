//
//  cellTableView.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import UIKit

class CellTableView: UITableViewCell {
    
    static let id = "schoolname"

    var titleCell: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = ""
        lable.numberOfLines = 0
        return lable
    }()
    
    var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUp()
    }
    
    private func setUp() {
        contentView.addSubview(titleCell)
        contentView.addSubview(bookImageView)
        
        let layout = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            bookImageView.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 8),
            bookImageView.topAnchor.constraint(equalTo: layout.topAnchor),
            bookImageView.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
            bookImageView.heightAnchor.constraint(equalToConstant: 100),
            bookImageView.widthAnchor.constraint(equalToConstant: 100),
            titleCell.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20),
            titleCell.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -20),
            titleCell.centerYAnchor.constraint(equalTo: layout.centerYAnchor),
//            titleCell.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
        ])
        
    }

}
