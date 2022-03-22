//
//  Movie.m
//  MovieDB OBJC
//
//  Created by João Brentano on 21/03/22.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@implementation Movie

- (Movie*)initWithJSONDictionary:(NSDictionary *)dictionary {
    Movie* movie = [Movie alloc];
    if(dictionary == nil) {
        return nil;
    }

    NSNumber* boolNumber = [dictionary objectForKey:@"adult"];
    [movie setAdult: [boolNumber boolValue]];
    [movie setBackdrop_path:dictionary[@"backdrop_path"]];
//    if([movie backdrop_path] == nil) {
//        return nil;
//    }
    NSSet* genreIds = [dictionary objectForKey:@"genre_ids"];
    [movie setGenre_ids:genreIds];
    [movie setMovieId:[dictionary objectForKey:@"id"]];
    [movie setOriginal_language:[dictionary objectForKey:@"original_language"]];
    [movie setOriginal_title:[dictionary objectForKey:@"original_title"]];
    [movie setOverview:[dictionary objectForKey:@"overview"]];
    [movie setPopularity:[dictionary objectForKey:@"popularity"]];
    [movie setPoster_path:[dictionary objectForKey:@"poster_path"]];
    //converter json para NSDate
    [movie setRelease_date:[dictionary objectForKey:@"release_date"]];
    [movie setTitle:[dictionary objectForKey:@"title"]];
    //fix bool?
    [movie setVideo:[dictionary objectForKey:@"video"]];
    [movie setVote_average:[dictionary objectForKey:@"vote_average"]];
    [movie setVote_count:[dictionary objectForKey:@"vote_count"]];
    NSData* imageData = nil; //naosei
    [movie setPoster:imageData];
    
    return movie;
}

@end
