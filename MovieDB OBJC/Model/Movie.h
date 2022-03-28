

//
//  Movie.h
//  MovieDB OBJC
//
//  Created by João Brentano on 21/03/22.
//

#import <UIKit/UIKit.h>

#ifndef Movie_h
#define Movie_h

@interface Movie : NSObject
    
@property (nonatomic, assign) NSNumber *movieID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *movieDescription;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, copy) NSString *posterURL;
@property (nonatomic, copy) UIImage *poster;
@property (nonatomic, copy) NSArray *genreIDs;
@property (nonatomic, retain) NSMutableArray *genres;

@end

#endif /* Movie_h */
