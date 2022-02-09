//
//  TableViewController.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/27.
//

import UIKit

class TableViewController: UIViewController {
    
    let list = [
        "teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste","teste"
    ]
    
    @IBOutlet weak var testTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    func setupInterface() {
        if #available(iOS 15.0, *) {
            testTableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
        let header = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 100))
        header.backgroundColor = UIColor.green
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 100))
        v.backgroundColor = UIColor.blue
        testTableView.tableHeaderView = v
        testTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 0.1))
        testTableView.contentInsetAdjustmentBehavior = .never
        testTableView.backgroundColor = UIColor.red
        testTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        testTableView.register(TableSectionHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        testTableView.delegate = self
        testTableView.dataSource = self
//        let v = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
//        testTableView.tableHeaderView = v
        testTableView.reloadData()
        
        print(testTableView.contentInset)
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = testTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        header?.contentView.backgroundColor = UIColor.green
        return header
    }
}
