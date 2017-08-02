//
//  HomeViewController.m
//  Movies
//
//  Created by george on 11/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuCollectionViewCell.h"
#import "GamesViewController.h"

@interface HomeViewController ()
{
    NSArray *menuArray;
    NSMutableArray *selectedProfileArray;
}


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = false;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    self.title = @"Home";
    
    UIBarButtonItem *button_blank = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil  action:nil];
    self.navigationItem.leftBarButtonItem = button_blank;

    menuArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu" ofType:@"plist"]];
    
    selectedProfileArray = [NSMutableArray array];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
#pragma mark -
#pragma mark UICollection View


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [menuArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menuCell" forIndexPath:indexPath];
    
    NSDictionary *dictionary = [menuArray objectAtIndex:indexPath.row];
    
    cell.label_title.text = [dictionary objectForKey:@"title"];
    cell.image_profile.image = [UIImage imageNamed:[dictionary objectForKey:@"image"]];
    
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    if(indexPath.row == 0)
    {
        NSDictionary *dictionary = [menuArray objectAtIndex:indexPath.row];

        GamesViewController *profileVC = [self.storyboard  instantiateViewControllerWithIdentifier:@"GamesViewController"];
        profileVC.title = [dictionary objectForKey:@"title"];
        [self.navigationController pushViewController:profileVC animated:YES];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Permission" message:@"You do not have permission to access this option!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:okButton];
        [self presentViewController:alert animated:NO completion:nil];
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{

    return CGSizeMake(199.0, 230.0);
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(2, 2, 2, 2);
    
}


#pragma mark -
#pragma mark Helper method


-(NSDictionary *)getDictionary:(NSString *)key andValue:(NSString *)value
{
    return [NSDictionary dictionaryWithObjectsAndKeys:key,@"title", value, @"value", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }


@end
