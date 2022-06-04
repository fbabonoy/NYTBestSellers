//
//  SchoolDetailView.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import UIKit

class SchoolDetailView: UIViewController {
    
    var id: String?
    var nameText: String?
    var network = ViewModelController()
    
    private var name: UILabel = {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = ""
        name.numberOfLines = 0
        return name
    }()
    
    private var math: UILabel = {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Math:      "
        name.numberOfLines = 0
        return name
    }()
    
    private var reading: UILabel = {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Reading: "
        name.numberOfLines = 0
        return name
    }()
    
    private var writing: UILabel = {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Writing:  "
        name.numberOfLines = 0
        return name
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp() {
        view.addSubview(name)
        view.addSubview(math)
        view.addSubview(reading)
        view.addSubview(writing)

        
        let layout = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            name.leftAnchor.constraint(equalTo: layout.leftAnchor, constant: 20),
            name.rightAnchor.constraint(equalTo: layout.rightAnchor, constant: -20),
            name.topAnchor.constraint(equalTo: layout.topAnchor, constant: 20),
            
            math.leftAnchor.constraint(equalTo: layout.leftAnchor, constant: 20),
            math.rightAnchor.constraint(equalTo: layout.rightAnchor, constant: -20),
            math.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -200),
            
            reading.leftAnchor.constraint(equalTo: layout.leftAnchor, constant: 20),
            reading.rightAnchor.constraint(equalTo: layout.rightAnchor, constant: -20),
            reading.bottomAnchor.constraint(equalTo: math.topAnchor, constant: -20),
            
            writing.leftAnchor.constraint(equalTo: layout.leftAnchor, constant: 20),
            writing.rightAnchor.constraint(equalTo: layout.rightAnchor, constant: -20),
            writing.bottomAnchor.constraint(equalTo: reading.topAnchor, constant: -20),

        ])
        

        
    }

    func setDetails(id: ViewModelController) {
        self.network = id
        name.text = network.getTitle(0)
    }
    
}

extension SchoolDetailView: NetworkDelegate {
    
    func dataFinished() {
        
//        reading.text = reading.text?.appending(network.getReadingScore())
//        math.text = math.text?.appending(network.getMathScore())
//        writing.text = writing.text?.appending(network.getWritingScore())
        
    }
    
}
