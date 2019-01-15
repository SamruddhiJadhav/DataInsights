//
//  DataSetView.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class DataSetView: UITableViewController, DataSetViewProtocol {
    var presenter: DataSetPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDataSet(with: "")
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= presenter?.getDataSet().count ?? 0
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
    
    func reloadTableView(_ path: [IndexPath]) {
        if path.isEmpty {
            tableView.reloadData()
        } else {
            tableView.reloadRows(at: path, with: .automatic)
        }
    }
}

extension DataSetView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getDataSet().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300//UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeYearCell(indexPath)
    }
    
    func makeYearCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataSetCell") as?  DataSetTableViewCell else {
            return UITableViewCell()
        }
        if let dataSet = presenter?.getDataSet()[indexPath.row] {
            cell.configureCell(dataSet.dataSet)
        } else if indexPath.row > 0 {
            cell.configureCell(nil)
            if let data = presenter?.getDataSet()[indexPath.row - 1] {
                presenter?.getDataSet(with: data.nextLink ?? "")
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        print("Log: Inside Prefetch")
        if indexPaths.contains(where: isLoadingCell) {
            if let data = presenter?.getDataSet()[indexPaths[0].row - 1] {
                presenter?.getDataSet(with: data.nextLink ?? "")
            }
        }
    }
}
