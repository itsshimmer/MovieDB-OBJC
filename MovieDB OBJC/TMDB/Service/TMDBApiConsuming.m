//
//  TMDBApiConsuming.m
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "TMDBApiConsuming.h"

@implementation TMDBApi 

NSString *APIKey = @"171ea8ef33bff26411439b2fe3e357c9";
NSString *language = @"en-US";



- (void) requestPopularMovies: (void (^)(NSMutableArray *))completion :(int)page {
    NSString* baseURL = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/popular?api_key=%@&language=%@&page=%d", APIKey,language, page];
    NSURL *url = [NSURL URLWithString:baseURL];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];

    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if(httpResponse.statusCode == 200) {
        NSError *parseError = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        NSLog(@"response = %@",responseDictionary);
      } else {
        NSLog(@"Error");
      }
    }];
    [dataTask resume];
}

- (void) requestMoviePoster: (void (^)(UIImage*))completion :(NSString*)poster_path {
    NSString* baseURL = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", poster_path];
    NSURL *url = [NSURL URLWithString:baseURL];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];

    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if(httpResponse.statusCode == 200) {
          NSError *parseError = nil;
          //UIImage *image = UIImage(data: data);
      } else {
        NSLog(@"Error");
      }
    }];
    [dataTask resume];
}

- (void) requestNowPlaying: (void (^)(NSMutableArray *))completion :(int)page {
    NSString* baseURL = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/now_playing?api_key=%@&language=%@&page=%d", APIKey,language, page];
    NSURL *url = [NSURL URLWithString:baseURL];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];

    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if(httpResponse.statusCode == 200) {
        NSError *parseError = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        NSLog(@"response = %@",responseDictionary);
      } else {
        NSLog(@"Error");
      }
    }];
    [dataTask resume];
}

- (void) requestGenres: (void (^)(NSDictionary*))completion {
    NSString* baseURL = [NSString stringWithFormat:@"https://api.themoviedb.org/3/genre/movie/list?api_key=%@&language=%@", APIKey,language];
    NSURL *url = [NSURL URLWithString:baseURL];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];

    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if(httpResponse.statusCode == 200) {
        NSError *parseError = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        NSLog(@"response = %@",responseDictionary);
      } else {
        NSLog(@"Error");
      }
    }];
    [dataTask resume];
}

@end



