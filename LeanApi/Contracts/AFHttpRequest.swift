//
//  AFHttpRequest.swift
//  LeanApi
//
//  Created by Mustafa KOCAK on 11.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract
import Alamofire

/*
 Af network implemantation
 */
public final class AFHttpRequest: HttpRequestProtocol{
    
   /*
     Cretaes http get rewuest over defined endpoint. Decodes model and returns data.
     */
    //TODO: do decoding operation in a clousure for dynamic decoder.
    public  func get<T>(_ type:T.Type, with urlEndpoind: UrlEndpoind, completion: @escaping (Result<T>) -> Void)  where T:(Decodable){
        //TODO: add other endpoind attributes like params and httpheaders
        
         AF.request(urlEndpoind.url,method: urlEndpoind.method,parameters: urlEndpoind.parameters,encoding:URLEncoding.queryString,headers: HTTPHeaders(urlEndpoind.additionalHeaders ?? [String:String]())).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    //Todo: get decoder dynamicly
                    let object = try decoder.decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
