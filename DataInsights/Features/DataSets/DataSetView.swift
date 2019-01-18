//
//  DataSetView.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class DataSetView: UITableViewController, DataSetViewProtocol {
    
    //MARK: - DataSetViewProtocol Variable
    var presenter: DataSetPresenterProtocol?
    
    //MARK: - DataSetView Variables
    let loadingIndicatorView = UIView()
    let loadingIndicator = UIActivityIndicatorView()
    
    //MARK: - DataSetView Constant
    static let DATASET_CELL_IDENTIFIER = "DataSetCell"
    
    //MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    //MARK: - DataSetViewProtocol Methods
    func reloadTableView() {
        tableView.reloadData()
    }
    
    //MARK: - Helper Methods
    func setupTableView() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = StringConstants.SIGN_OUT_LABEL
        setupLoadingIndicator()
    }
    
    func setupLoadingIndicator() {
        loadingIndicatorView.frame = view.frame
        loadingIndicatorView.backgroundColor = .gray
        loadingIndicatorView.isHidden = true
        
        setupSpinner()
    }
    
    func setupSpinner() {
        loadingIndicator.center = CGPoint(
            x: UIScreen.main.bounds.size.width / 2,
            y: UIScreen.main.bounds.size.height / 2
        )
        loadingIndicator.color = .white
        loadingIndicator.hidesWhenStopped = true
        loadingIndicatorView.addSubview(loadingIndicator)
        view.addSubview(loadingIndicatorView)
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator.startAnimating()
            self.loadingIndicatorView.isHidden = false
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicatorView.isHidden = true
        }
    }
    
    func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: StringConstants.ERROR_TITLE,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: StringConstants.OK_LABEL,
                                      style: .default,
                                      handler: { [weak self] action in
                                        self?.presenter?.okButtonClicked()
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension DataSetView {
    
    //MARK: - Table View Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.dataSets.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataSetView.DATASET_CELL_IDENTIFIER) as?  DataSetTableViewCell else {
            return UITableViewCell()
        }
        if let dataSet = presenter?.dataSets[indexPath.row] {
            cell.configureCell(dataSet.dataSet)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let dataSets = presenter?.dataSets, dataSets.count > 0 && dataSets.count < Constants.TOTAL_ENTRIES, let previousDataSet = presenter?.dataSets.last {
            presenter?.getDataSet(with: previousDataSet?.nextLink ?? "")
        }
    }
}
