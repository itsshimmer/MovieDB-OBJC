//
//  TMDBService.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#import <UIKit/UIKit.h>
#import "TMDBApiConsuming.h"
#import "MovieDBParser.h"

@interface TMDBService : NSObject

@property TMDBApi *api;

- (void)getPopularMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion;

- (void)getNowPlayingMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion;

- (void)getMoviePoster:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion;

- (void)getGenres:(NSArray*)genreIDs completion:(void (^)(NSMutableArray *, NSError *))completion;

- (void)getTotalPages:(NSString*)url completion:(void (^)(NSNumber *, NSError *))completion;

@end
