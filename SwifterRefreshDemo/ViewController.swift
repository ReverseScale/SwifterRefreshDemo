//
//  ViewController.swift
//  SwifterRefreshDemo
//
//  Created by WhatsXie on 2017/10/24.
//  Copyright © 2017年 R.S. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet private weak var tableView: UITableView!

    var count = 1
    let refreshControl = GIFRefreshControl()

    //MARK: Refresh control

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.animatedImage = GIFAnimatedImage(data: try! Data(contentsOf: Bundle.main.url(forResource: "guitar", withExtension: "gif")!))
        refreshControl.contentMode = .scaleAspectFill
        refreshControl.addTarget(self, action: #selector(ViewController.refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }


    //MARK: Refresh
    func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.count += 1
            self.refreshControl.endRefreshing()

            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(item: 0, section: 0)],
                with: .none)
            self.tableView.endUpdates()
        }
    }


    //MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
    }
}
