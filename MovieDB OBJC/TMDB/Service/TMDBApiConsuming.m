//
//  TMDBApiConsuming.m
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "TMDBApiConsuming.h"
#import "UIKit/UIkit.h"

@implementation TMDBApi

- (void)requestGenres: (void (^)(NSDictionary *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/genre/movie/list?api_key=171ea8ef33bff26411439b2fe3e357c9&language=en-US"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                completion(nil, error);
            } else {
                completion(dictionary[@"genres"], nil);
            }
        } else {
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}

- (void)requestTotalPagesWithURL:(NSString*)url completion:(void (^)(NSNumber*, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSNumber *pages = dictionary[@"total_pages"];
            
            if (error) {
                completion(nil, error);
            } else {
                completion(pages, nil);
            }
        } else {
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}
- (void)requestMoviePosterWithURL:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%s%@", "https://image.tmdb.org/t/p/original", url]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            completion([UIImage imageWithData:data], nil);
        } else {
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}

- (void)requestPopularMoviesFromPage:(NSNumber*)page completion:(void (^)(NSArray *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%s%@", "https://api.themoviedb.org/3/movie/popular?api_key=171ea8ef33bff26411439b2fe3e357c9&language=en-US&page=", page]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *dictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                completion(nil, error);
            } else {
                completion(dictionaries[@"results"], nil);
            }
        } else {
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
    
}
- (void)requestNowPlayingMoviesFromPage:(NSNumber*)page completion:(void (^)(NSArray *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%s%@", "https://api.themoviedb.org/3/movie/now_playing?api_key=171ea8ef33bff26411439b2fe3e357c9&language=en-US&page=", page]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *dictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                completion(nil, error);
            } else {
                completion(dictionaries[@"results"], nil);
            }
        } else {
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}

@end



