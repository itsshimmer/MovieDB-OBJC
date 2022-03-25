//
//  TMDBService.m
//  MovieDB OBJC
//
//  Created by Lucca Molon on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "TMDBService.h"

@implementation TMDBService

TMDBApi *api = nil;
+ (void)initialize {
    if(!api)
        api = [[TMDBApi alloc] init];
}

//parser

- (void) getPopularMovies: (void (^)(NSMutableArray *))completion :(int)page {
    [api requestPopularMovies:^(NSMutableArray* movies) {
        // parser
    }  :page];
}

- (void) getNowPlaying: (void (^)(NSMutableArray *))completion :(int)page {
    
}

@end
