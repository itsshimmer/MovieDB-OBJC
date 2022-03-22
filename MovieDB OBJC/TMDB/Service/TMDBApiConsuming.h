//
//  TMDBApiConsuming.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#ifndef TMDBApiConsuming_h
#define TMDBApiConsuming_h

@interface TMDBApi : NSObject

- (Movie[]*) requestPopularMovies: (void (^)([NSDictionary*]))completion (int)page;

- (UIImage*) requestMoviePoster: (void (^)([NSDictionary*]))completion (NSString)poster_path;

- (Movie[]*) requestNowPlaying: (void (^)([NSDictionary*]))completion (int)page;

- (void) requestGenres: (void (^)([NSDictionary*]))completion;

@end


#endif /* TMDBApiConsuming_h */
