//
//  WebService.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import Foundation

final class WebService {
    class func loadData<T>(resource: Resource<T>, completion: @escaping (T?) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
