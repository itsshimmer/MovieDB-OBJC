//
//  Genre.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 28/03/22.
//

#ifndef Genre_h
#define Genre_h

#import <UIKit/UIKit.h>

@interface Genre : NSObject

@property (nonatomic, assign) NSNumber *genreID;
@property (nonatomic, copy) NSString *title;

@end


#endif /* Genre_h */
