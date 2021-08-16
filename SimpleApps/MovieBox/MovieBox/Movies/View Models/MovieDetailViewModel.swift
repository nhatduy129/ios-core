//
//  MovieDetailViewModel.swift
//  MovieBox
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import Foundation

final class MovieDetailViewModel {
    private let movieDetail: MovieDetail
    
    init(movieDetail: MovieDetail) {
        self.movieDetail = movieDetail
    }
    
    func getTitle() -> String? {
        return movieDetail.title
    }
    
    func getReleaseDateAndRuntime() -> String? {
        let releaseDate = movieDetail.releaseDate?.toString(format: "MMMM d, yyyy") ?? "Unknown"
        var runtimeString = "Unknown"
        if let runtime = movieDetail.runtime {
            if runtime > 60 {
                runtimeString = "\(runtime / 60)h \(runtime % 60)m"
            } else {
                runtimeString = "\(runtime)m"
            }
        }
        return "\(releaseDate)  -  \(runtimeString)"
    }
    
    func getOverview() -> String? {
        return movieDetail.overview
    }
    
    func getPosterURL() -> URL? {
        return movieDetail.getPosterURL()
    }
    
    func getNumberOfGenres() -> Int {
        return movieDetail.genres?.count ?? 0
    }
    
    func getGenre(byIndex index: Int) -> Genre? {
        return movieDetail.genres?[index]
    }
}
