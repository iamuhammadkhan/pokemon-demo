//
//  Resource.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import Foundation

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod
    let parse: (Data) -> T?
    var body: Data? = nil
}
