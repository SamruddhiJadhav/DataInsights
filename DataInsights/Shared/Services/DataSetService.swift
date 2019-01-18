//
//  DataSetService.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class DataSetService: DataSetServiceProtocol {
    
    //MARK: - DataSetServiceProtocol Method
    func getDataSet(for url: String, completion: @escaping([String : Any]?, Error?) -> Void) {
        var completeUrl = ""
        
        if url.isEmpty {
            completeUrl = Constants.DATA_URL
        } else {
            completeUrl = "\(Constants.BASE_URL)\(url)"
        }
        
        let url = URL(string: completeUrl)
        guard let urlValue = url else {
            return
        }
        
        let request = URLRequest(url: urlValue)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let object = data, object.count > 0 {
                do {
                    let json = try JSONSerialization.jsonObject(with: object, options: [])
                    completion(json as? [String : Any], nil)
                } catch {
                    completion(nil, nil)
                    debugPrint("Error: JSONSerialization fail")
                }
            } else if error != nil {
                completion(nil, error)
                debugPrint("Error: Failure")
            }
        }.resume()
    }
}
