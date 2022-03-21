//
//  Movie.h
//  MovieDB OBJC
//
//  Created by João Brentano on 21/03/22.
//

#ifndef Movie_h
#define Movie_h

@interface Movie : NSObject

@property BOOL adult;
@property NSString* backdrop_path;
@property NSSet* genre_ids;
@property NSInteger* id;
@property NSString* original_language;
@property NSString* original_title;
@property NSString* overview;
@property NSNumber* popularity;
@property NSString* poster_path;
@property NSDate* release_date;
@property NSString* title;
@property BOOL video;
@property NSNumber* vote_average;
@property NSNumber* vote_count;
@property NSData* poster;

- (Movie*) initWithJSONDictionary: (NSDictionary*) dictionary;

@end Movie;

#endif /* Movie_h */
