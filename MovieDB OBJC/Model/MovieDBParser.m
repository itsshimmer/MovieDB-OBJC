//
//  MovieDBParser.m
//  MovieDB OBJC
//
//  Created by Lucca Molon on 23/03/22.
//

#import "MovieDBParser.h"

@interface MovieDBParser ()
@end

@implementation MovieDBParser

- (Movie*)parseMovieDictionary:(NSDictionary*)dictionary {
    NSNumber *movieID = dictionary[@"id"];
    NSString *title = dictionary[@"title"];
    NSString *movieDescription = dictionary[@"overview"];
    NSNumber *rating = dictionary[@"vote_average"];
    NSString *posterURL = dictionary[@"poster_path"];
    NSArray *genreIDs = dictionary[@"genre_ids"];
    
    Movie *movie = [[Movie alloc] init];
    movie.title = title;
    movie.movieID = movieID;
    movie.movieDescription = movieDescription;
    movie.rating = rating;
    movie.posterURL = posterURL;
    movie.genreIDs = genreIDs;
    movie.genres = [[NSMutableArray alloc] init];
    
    return movie;
}

- (Genre*)parseGenreDictionary:(NSDictionary*)dictionary {
    NSNumber *genreID = dictionary[@"id"];
    NSString *name = dictionary[@"name"];
    
    Genre *genre = [[Genre alloc] init];
    genre.title = name;
    genre.genreID = genreID;
    
    return genre;
}

@end

