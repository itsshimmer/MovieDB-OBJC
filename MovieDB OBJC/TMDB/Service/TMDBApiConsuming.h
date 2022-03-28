//
//  TMDBApiConsuming.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#import "UIKit/UIKit.h"


@interface TMDBApi : NSObject

- (void)requestGenres: (void (^)(NSDictionary *, NSError *))completion;

- (void)requestTotalPagesWithURL:(NSString*)url completion:(void (^)(NSNumber *, NSError *))completion;

- (void)requestMoviePosterWithURL:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion;

- (void)requestPopularMoviesFromPage:(NSNumber*)page completion:(void (^)(NSArray *, NSError *))completion;

- (void)requestNowPlayingMoviesFromPage:(NSNumber*)page completion:(void (^)(NSArray *, NSError *))completion;

@end


//171ea8ef33bff26411439b2fe3e357c9
