//
//  HomePageViewController.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/11.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let cellConfigs: [String] = [
        "coreText",
        "ViewControllerAnmi"
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInderface()
    }
    
    private func setupInderface() {
        view.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    @IBAction func toLogin(_ sender: Any) {
        WindowManager.shared.login()
    }
}

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellConfigs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cellConfigs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = cellConfigs[indexPath.row]
        switch cell {
        case "coreText":
            break
        case "ViewControllerAnmi":
            let vc = ChangeAnimationViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
