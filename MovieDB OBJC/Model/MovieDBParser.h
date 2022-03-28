//
//  MovieDBParser.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 23/03/22.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "Genre.h"
#import "MovieDBParser.h"

@interface MovieDBParser : NSObject

- (Movie*)parseMovieDictionary:(NSDictionary*)dictionary;
- (Genre*)parseGenreDictionary:(NSDictionary*)dictionary;

@end
