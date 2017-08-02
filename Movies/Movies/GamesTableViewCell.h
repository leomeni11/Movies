//
//  GamesTableViewCell.h
//  Movies
//
//  Created by george on 12/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *label_title;
@property (strong, nonatomic) IBOutlet UILabel *label_subtitle;
@property (strong, nonatomic) IBOutlet UIImageView *image_profile;

@end
