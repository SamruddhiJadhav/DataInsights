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
            
        if !ReachabilityManager.isConnectedToNetwork() {
            getDataSetFromCache(request, completion: completion)
        } else {
            getDataSetFromAPI(request, completion: completion)
        }
    }
    
    func getDataSetFromCache(_ request: URLRequest, completion: @escaping([String : Any]?, Error?) -> Void) {
        let cacheResponse = URLCache.shared.cachedResponse(for: request)
        if let data = cacheResponse?.data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("Log: Data From Cache: \(json)")
                completion(json as? [String : Any], nil)
            } catch {
                completion(nil, nil)
                print("Error: JSONSerialization fail")
            }
        } else {
            print("Error: Data is not available")
            completion(nil, nil)
        }
    }
    
    func getDataSetFromAPI(_ request: URLRequest, completion: @escaping([String : Any]?, Error?) -> Void) {
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
