//
//  APIClient.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

final class APIClient {
    
    var baseURL: URL?
    
    static let shared = { APIClient(baseUrl: APIManager.shared.baseURL) }()
    
    private let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Content-Type": "application/json"
    ]
    
    required init(baseUrl: String){
        self.baseURL = URL(string: baseUrl)
    }
    
    //MARK: Use to download array of albums
    func getArray<T>(urlString: String,
                     success: @escaping (Int, [T]) -> (),
                     failure: @escaping (Int) -> ()) where T: BaseMappable {
        
        
        
        guard let url = NSURL(string: urlString , relativeTo: self.baseURL as URL?) else {
            return
        }
        
        let urlString = url.absoluteString!
        
        Alamofire
            .request(urlString,
                     method: .get,
                     encoding: JSONEncoding.default,
                     headers: headers)
            .responseArray { (dataResponse: DataResponse<[T]>) in
                
                guard let serverResponse = dataResponse.response,
                      let resultValue = dataResponse.result.value else {
                    failure(400)
                    return
                }
                
                switch serverResponse.statusCode {
                case 200, 201:
                    success(serverResponse.statusCode, resultValue)
                default:
                    failure(serverResponse.statusCode)
                }
            }
    }
    
    //MARK: Use to download single album
    func getDict<T>(urlString: String,
                     success: @escaping (Int, T) -> (),
                     failure: @escaping (Int) -> ()) where T: BaseMappable {

        guard let url = NSURL(string: urlString , relativeTo: self.baseURL as URL?) else {
            return
        }
        
        let urlString = url.absoluteString!
        
        Alamofire
            .request(urlString,
                     method: .get,
                     encoding: JSONEncoding.default,
                     headers: headers)
            .responseObject { (dataResponse: DataResponse<T>) in
                
                guard let serverResponse = dataResponse.response,
                    let resultValue = dataResponse.result.value else {
                        failure(400)
                        return
                }
                
                switch serverResponse.statusCode {
                case 200, 201:
                    success(serverResponse.statusCode, resultValue)
                default:
                    failure(serverResponse.statusCode)
                }
        }
    }
}
