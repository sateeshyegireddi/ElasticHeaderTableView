//
//  ViewController.swift
//  ElasticHeaderTableView
//
//  Created by Sateesh on 12/12/18.
//  Copyright © 2018 Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var elasticTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        elasticTableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        elasticTableView.dataSource = self
        elasticTableView.delegate = self
//        elasticTableView.estimatedRowHeight = 50
        elasticTableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        view.addSubview(elasticTableView)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
        imageView.image = UIImage(named: "water")
        imageView.contentMode = .scaleToFill
        view.addSubview(imageView)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellId")
        }
        cell?.textLabel?.text = "IndexPath -- \(indexPath.row)"
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    
    
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 600)
        imageView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}
