//
//  GameNameViewController.m
//  Movies
//
//  Created by george on 12/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import "GameNameViewController.h"
#import "GamesViewController.h"

@interface GameNameViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label_title;
@property (strong, nonatomic) IBOutlet UILabel *label_subtitle;
@property (strong, nonatomic) IBOutlet UIImageView *imageview_icon;

@end

@implementation GameNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [_completeInfo objectForKey:@"title"];
    self.label_subtitle.text = [_completeInfo objectForKey:@"subtitle"];
    self.imageview_icon.image = [UIImage imageNamed:[_completeInfo objectForKey:@"picture"]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

-(IBAction)returnToPrevious:(id)sender
{

    [[self navigationController] popViewControllerAnimated:YES];



}
@end
