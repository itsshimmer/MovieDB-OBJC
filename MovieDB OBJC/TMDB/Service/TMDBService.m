//
//  TMDBService.m
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "TMDBService.h"

@implementation TMDBService {
    TMDBApi *movieAPI;
    MovieDBParser *movieDBParser;
}

- (void)getPopularMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion {
    movieAPI = [[TMDBApi alloc] init];
    movieDBParser = [[MovieDBParser alloc] init];
    
    [movieAPI requestPopularMoviesFromPage:page completion:^(NSArray *dictionaries, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSMutableArray *movies = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in dictionaries) {
                [movies addObject: [self->movieDBParser parseMovieDictionary: dictionary]];
            }
            completion(movies, error);
        }
        
    }];
    
}

- (void)getNowPlayingMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion {
    movieAPI = [[TMDBApi alloc] init];
    movieDBParser = [[MovieDBParser alloc] init];
    
    [movieAPI requestNowPlayingMoviesFromPage:page completion:^(NSArray *dictionaries, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSMutableArray *movies = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in dictionaries) {
                [movies addObject: [self->movieDBParser parseMovieDictionary: dictionary]];
            }
            completion(movies, error);
        }
        
    }];
    
}
- (void)getMoviePoster:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion {
    movieAPI = [[TMDBApi alloc] init];
    
    [movieAPI requestMoviePosterWithURL:url completion:^(UIImage *poster, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            completion(poster, error);
        }
    }];
    
}

- (void)getGenres:(NSArray*)genreIDs completion:(void (^)(NSMutableArray *, NSError *))completion {
    movieAPI = [[TMDBApi alloc] init];
    movieDBParser = [[MovieDBParser alloc] init];
    
    [movieAPI requestGenres:^(NSDictionary *dictionaries, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSMutableArray *genres = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in dictionaries) {
                [genres addObject: [self->movieDBParser parseGenreDictionary: dictionary]];
            }
            completion(genres, error);
        }
    }];
}

- (void)getTotalPages:(NSString*)url completion:(void (^)(NSNumber *, NSError *))completion {
    movieAPI = [[TMDBApi alloc] init];
    
    [movieAPI requestTotalPagesWithURL:url completion:^(NSNumber *pages, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            completion(pages, error);
        }
    }];
}

@end
