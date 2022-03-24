//
//  TMDBApiConsuming.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#ifndef TMDBApiConsuming_h
#define TMDBApiConsuming_h
#import "UIKit/UIKit.h"
#import "Movie.h"
#import <Foundation/Foundation.h>

@interface TMDBApi : NSObject

- (void) requestPopularMovies: (void (^)(NSMutableArray *))completion :(int)page;

- (void) requestMoviePoster: (void (^)(UIImage*))completion :(NSString*)poster_path;

- (void) requestNowPlaying: (void (^)(NSMutableArray *))completion :(int)page;

- (void) requestGenres: (void (^)(NSDictionary*))completion;

@end


#endif /* TMDBApiConsuming_h */
