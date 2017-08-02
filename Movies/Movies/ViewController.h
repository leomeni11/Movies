//
//  ViewController.h
//  Movies
//
//  Created by george on 11/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *image_icon;
@property (strong, nonatomic) IBOutlet UIButton *button_next;

@property NSDictionary *introDictionary;
@property NSUInteger pageIndex;
@property bool isLastPage;


@end

