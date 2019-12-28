//
//  PostViewController.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/21.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class PostViewController: UIViewController, IndicatorInfoProvider {
    
    let postCellID = "postCell"
    let headerCellID = "headerCell"
    
    var tableView = UITableView(frame: CGRect.zero, style: .grouped)
      
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "POST")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostCell.self, forCellReuseIdentifier: postCellID)
        tableView.register(PostSectionHeader.self,forHeaderFooterViewReuseIdentifier: headerCellID)
        
        view.addSubview(tableView)
        
        setupTableView()
    }
    
}

//MARK: - UI AutoLayout

extension PostViewController {
    private func setupTableView() {
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - TableView DataSource & Delegate

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCellID, for: indexPath)  as! PostCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    //TODO: 사이즈 고정할 건지 정해야함
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    // 섹션 헤더
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier:
            headerCellID) as? PostSectionHeader else {
                return UITableViewHeaderFooterView()
        }
        
        return header
    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        tableView.headerView(forSection: section)?.backgroundView?.backgroundColor = .white
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
