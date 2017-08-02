//
//  GamesViewController.h
//  Movies
//
//  Created by george on 12/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>


@property(nonatomic, strong) NSMutableDictionary *completeInfo;
@property (strong, nonatomic) IBOutlet UIButton *back_button;
-(IBAction):backbutton:(id)sender;

@end
