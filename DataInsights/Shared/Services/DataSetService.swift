//
//  DataSetService.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class DataSetService: DataSetServiceProtocol {
    func getDataSet(for url: String, completion: @escaping([String : Any]?, Error?) -> Void) {
        var thefullUrl = ""
        if url.isEmpty {
            thefullUrl = "https://data.gov.sg/api/action/datastore_search?offset=14&limit=4&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f"
        } else {
            thefullUrl = "https://data.gov.sg\(url)"
        }
        
        let url = URL(string: thefullUrl)
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
                    print("Error: JSONSerialization fail")
                }
            } else if error != nil {
                completion(nil, error)
            }
        }.resume()
    }
}
