//
//  ViewController.swift
//  NYTBestSellers
//
//  Created by fernando babonoyaba on 6/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    let network = ViewModelController()
    
    private lazy var tableOfSchools: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CellTableView.self, forCellReuseIdentifier: CellTableView.id)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        network.createData()
        network.loadData = self

    }

    private func setUp() {
        view.addSubview(tableOfSchools)
        
        tableOfSchools.rowHeight = UITableView.automaticDimension
        
        let layout = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableOfSchools.leftAnchor.constraint(equalTo: layout.leftAnchor),
            tableOfSchools.rightAnchor.constraint(equalTo: layout.rightAnchor),
            tableOfSchools.topAnchor.constraint(equalTo: layout.topAnchor),
            tableOfSchools.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
        ])
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return network.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTableView.id, for: indexPath) as? CellTableView else { return CellTableView() }
        cell.titleCell.text = network.getTitle(indexPath.row)
        
        network.getBookImage(indexPath.row) { image in
            DispatchQueue.main.async {
                cell.bookImageView.image = image
            }
        }
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = BooksDetailView()
        detailView.setDetails(id: network, row: indexPath.row)
        present(detailView, animated: true)
    }
}

extension ViewController: NetworkDelegate {
    
    func dataFinished() {
        tableOfSchools.reloadData()
    }
    
}

