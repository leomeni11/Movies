//
//  GamesViewController.m
//  Movies
//
//  Created by george on 12/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import "GamesViewController.h"
#import "GamesTableViewCell.h"
#import "GameNameViewController.h"

@interface GamesViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *gamesArray;
    NSMutableArray *selectedProfileArray;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableview_profile;

@end

@implementation GamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     gamesArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"games" ofType:@"plist"]];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
        // This will remove extra separators from tableview
        self.tableview_profile.tableFooterView = [UIView new];
 }

#pragma mark -
#pragma UITableView Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GamesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"gameCell"];
    NSDictionary *profileDict = [gamesArray objectAtIndex:indexPath.row];
    cell.label_title.text = [profileDict objectForKey:@"title"];
    cell.label_subtitle.text = [profileDict objectForKey:@"subtitle"];
    NSString *fileName = [profileDict objectForKey:@"picture"]; //convert string to image
    cell.image_profile.image = [UIImage imageNamed:fileName];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.image_profile.layer.cornerRadius = 10.0;
    cell.image_profile.layer.borderColor = [UIColor orangeColor].CGColor;
    cell.image_profile.layer.borderWidth = 3.0;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [gamesArray count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GameNameViewController *gameVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GameNameViewController"];
    gameVC.completeInfo = [gamesArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:gameVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }



@end
