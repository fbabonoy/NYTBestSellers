//
//  SchoolDetailView.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import UIKit

class BooksDetailView: UIViewController {
        
    private var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var bookTitle: UILabel = {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 0
        return name
    }()
    
    private var bookDescription: UILabel = {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 0
        name.textAlignment = .center
        return name
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp() {
        
        view.addSubview(image)
        view.addSubview(bookTitle)
        view.addSubview(bookDescription)

        let layout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: layout.topAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 150),
            image.centerXAnchor.constraint(equalTo: layout.centerXAnchor),
            
            bookTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            bookTitle.centerXAnchor.constraint(equalTo: layout.centerXAnchor),
            
            bookDescription.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 20),
            bookDescription.leftAnchor.constraint(equalTo: layout.leftAnchor),
            bookDescription.rightAnchor.constraint(equalTo: layout.rightAnchor),
        ])
       
    }

    func setDetails(id: ViewModelController, row: Int) {
        bookTitle.text = id.getTitle(row)
        bookDescription.text = id.getDescription(row)
        id.getBookImage(row) { realImage in
            DispatchQueue.main.async {
                self.image.image = realImage
            }
        }
//        guard let imageData = id.getBookImage(row) else { return }
//        image.image = UIImage(data: imageData)
    }
    
}
