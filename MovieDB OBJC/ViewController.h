//
//  ViewController.h
//  MovieDB OBJC
//
//  Created by João Brentano on 21/03/22.
//

#import <UIKit/UIKit.h>
#import "TMDB/Service/TMDBApiConsuming.h"

@interface ViewController : UIViewController
//@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
//@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *movieDescriptionLabel;
//@property (weak, nonatomic) IBOutlet UILabel *movieRatingLabel;

@property TMDBApi *api;

@end

