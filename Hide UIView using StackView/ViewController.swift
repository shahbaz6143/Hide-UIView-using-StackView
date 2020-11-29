//
//  ViewController.swift
//  Hide UIView using StackView
//
//  Created by Shahbaz Alam on 15/11/20.
//  Copyright © 2020 Shahbaz Alam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }

    @IBAction func editBtnClick(_ sender: UIButton) {
        edit.setTitle("Done", for: .normal)
        edit.addTarget(self, action: #selector(doneBtnClick), for: .touchUpInside)
        self.bottomView.isHidden = true
    
    }
    
    @objc func doneBtnClick() {
        edit.setTitle("Edit", for: .normal)
        edit.addTarget(self, action: #selector(editBtnClick(_:)), for: .touchUpInside)
        self.bottomView.isHidden = false
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
