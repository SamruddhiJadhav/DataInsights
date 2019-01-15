//
//  DataSetView.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class DataSetView: UITableViewController, DataSetViewProtocol {
    
    // MARK: - DataSetViewProtocol Variable
    var presenter: DataSetPresenterProtocol?
    
    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //tableView.prefetchDataSource = self
    }
    
    // MARK: - Helper Methods
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= presenter?.getDataSet().count ?? 0
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
    
    //MARK: - DataSetViewProtocol Methods
    func reloadTableView(_ path: [IndexPath]) {
        if path.isEmpty {
            tableView.reloadData()
        } else {
            tableView.reloadRows(at: path, with: .automatic)
        }
    }
}

extension DataSetView {
    
    // MARK: - Table View Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getDataSet().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeDataSetCell(indexPath)
    }
    
    func makeDataSetCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataSetCell") as?  DataSetTableViewCell else {
            return UITableViewCell()
        }
        if let dataSet = presenter?.getDataSet()[indexPath.row] {
            cell.configureCell(dataSet.dataSet)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("Log: Inside Prefetch")
//        if indexPaths.contains(where: isLoadingCell) {
//            if let data = presenter?.getDataSet()[indexPaths[0].row - 1] {
//                presenter?.getDataSet(with: data.nextLink ?? "")
//            }
//        }
        
        if let data = presenter?.getDataSet(), data.count > 0 && data.count < Constants.TOTAL_ENTRIES, let prevData = presenter?.getDataSet().last {
            presenter?.getDataSet(with: prevData?.nextLink ?? "")
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let data = presenter?.getDataSet(), data.count > 0 && data.count < Constants.TOTAL_ENTRIES, let prevData = presenter?.getDataSet().last {
            presenter?.getDataSet(with: prevData?.nextLink ?? "")
        }
    }
}
