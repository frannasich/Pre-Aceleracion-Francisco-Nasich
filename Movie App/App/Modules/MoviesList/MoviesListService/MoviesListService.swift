//
//  MoviesListService.swift
//  Movie App
//
//  Created by Fran Nasich on 26/02/2022.
//

import Foundation

class MoviesListService{
    func getMovies(onComplete: @escaping ([MovieList]) -> Void, onError: @escaping () -> Void) {
        let URL = Constants().MoviesListURL
        let apiKey = Constants().ApiKey
        ApiManager.shared.get(url: (URL + apiKey)) {response in
            switch response {
            case .success(let data):
                
                do{
                    
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let movieResponse = try decoder.decode(MovieListResponse.self, from: data)
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
