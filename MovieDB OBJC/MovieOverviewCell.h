//
//  MovieOverviewCell.h
//  MovieDB OBJC
//
//  Created by Lucca Molon on 28/03/22.
//

#import <UIKit/UIKit.h>

@interface MovieOverviewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *overviewLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;

@end
