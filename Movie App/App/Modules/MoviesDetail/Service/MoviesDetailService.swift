//
//  MoviesDetailService.swift
//  Movie App
//
//  Created by Fran Nasich on 28/02/2022.
//

import Foundation

class MoviesDetailService{
    
    
    func getMovie(onComplete: @escaping (MovieDetail) -> Void, onError: @escaping () -> Void) {
        let URL = Constants().MoviesListURL
        let apiKey = Constants().ApiKey
        let movieId = MoviesDetailViewController().movieId ?? ""
        ApiManager.shared.get(url: (URL + movieId + apiKey)) {response in
            switch response {
            case .success(let data):
                
                do{
                    
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let movieResponse = try decoder.decode(MovieDetail.self, from: data)
                        print(movieResponse)
                        onComplete(movieResponse)
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
