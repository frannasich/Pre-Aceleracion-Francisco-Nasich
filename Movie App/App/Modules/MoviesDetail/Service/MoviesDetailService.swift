//
//  MoviesDetailService.swift
//  Movie App
//
//  Created by Fran Nasich on 28/02/2022.
//

import Foundation

class MoviesDetailService{
    
    func getMovies(onComplete: @escaping ([MovieDetail]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: Constants().MoviesListURL) {response in
            switch response {
            case .success(let data):
                
                do{
                    
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let movieResponse = try decoder.decode(MovieDetailResponse.self, from: data)
                        print(movieResponse.results)
                        onComplete(movieResponse.results)
                    }else{
                        onError()
                    }
                } catch{
                    onError()
                    print(error)
                }
                
            case .failure(_):
                onError()
            }
        }
    }
}
