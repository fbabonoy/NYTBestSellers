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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUp()
    }
    
    private func setUp() {
        contentView.addSubview(titleCell)
        
        let layout = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleCell.leftAnchor.constraint(equalTo: layout.leftAnchor, constant: 20),
            titleCell.rightAnchor.constraint(equalTo: layout.rightAnchor, constant: -20),
            titleCell.topAnchor.constraint(equalTo: layout.topAnchor),
            titleCell.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
        ])
        
    }

}
