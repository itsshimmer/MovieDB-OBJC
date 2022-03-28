//
//  MovieTableViewCell.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 21/03/22.
//

#import <UIKit/UIKit.h>


@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UILabel *movieDescription;
@property (weak, nonatomic) IBOutlet UILabel *movieRating;
@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;



@end


