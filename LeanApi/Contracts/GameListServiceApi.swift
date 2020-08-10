//
//  GameListServiceApi.swift
//  LeanApi
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract
import Alamofire

public class GameListServiceApi:GameListServiceProtocol
{
    var api: ApiEnvironmentProtocol!
    var httpRequest: HttpRequestProtocol
    public required init(_ environment: Environment) {
        switch environment {
        case .development:
            api = DevelopmentEnvironment()
        case .production:
            api = ProductionEnvironment()
        }
        httpRequest = AFHttpRequest()
    }
    
    public func fetchGameList(_ page: Int, take itemCount: Int, search key:String, on complatition: @escaping ((Result<GameListModel>) -> Void)) {
        //TODO: check internet connection, use cached data if requied.
        httpRequest.get(GameListModel.self, with: api.GameListUrl(page, take: itemCount, search: key), completion: complatition)
    }
    
    public func fetchGameDetail(with gameId: Int, complatition: @escaping((Result<GameDetailModel>) -> Void)) {
          //TODO: check internet connection, use cached data if requied.
        httpRequest.get(GameDetailModel.self, with: api.GameDetailUrl(with: gameId), completion: complatition)
        
    }
    
    
    
}
public enum Error: Swift.Error {
       case serializationError(internal: Swift.Error)
       case networkError(internal: Swift.Error)
   }


public protocol HttpRequestProtocol {
    /*
     creates http request with decodable model type and returns data.
     */
     func get<T>(_ type:T.Type,with urlEndpoind: UrlEndpoind, completion: @escaping (Result<T>) -> Void)  where T:(Decodable)
}

/*
 Af network implemantation
 */
public final class AFHttpRequest: HttpRequestProtocol{
    
   
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
