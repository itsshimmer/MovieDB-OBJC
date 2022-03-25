//
//  TMDBService.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#ifndef TMDBService_h
#define TMDBService_h
#import "TMDBApiConsuming.h"

#endif /* TMDBService_h */

@interface TMDBService : NSObject

@property TMDBApi *api;

- (void) getPopularMovies: (void (^)(NSMutableArray *))completion :(int)page;

- (void) getNowPlaying: (void (^)(NSMutableArray *))completion :(int)page;

@end
