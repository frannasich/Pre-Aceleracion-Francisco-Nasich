//
//  ApiManager.swift
//  Movie App
//
//  Created by Fran Nasich on 26/02/2022.
//

import Foundation
import Alamofire

class ApiManager {
    static let shared = ApiManager()
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
            print(response.result)
        }
    }
}
