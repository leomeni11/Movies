//
//  ViewController.m
//  Movies
//
//  Created by george on 11/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "PageViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label_title;
@property (strong, nonatomic) IBOutlet UILabel *label_subtitle;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image_icon.image = [UIImage imageNamed:[_introDictionary objectForKey:@"image"]];
    
    _label_subtitle.text = [_introDictionary objectForKey:@"title"];
    _label_title.text = [_introDictionary objectForKey:@"subtitle"];
    
    NSString *colorString = [_introDictionary objectForKey:@"color"];
    
    self.view.backgroundColor = [self getColorFromString:colorString];
    
    NSLog(@"%@",colorString);
    
    if(!_isLastPage)
    {
        [_button_next setHidden:TRUE];
        [_button_next setEnabled:FALSE];
    }
    
}

-(UIColor *)getColorFromString:(NSString *)colorString
{
    NSArray *splitArray = [colorString componentsSeparatedByString:@"|"];
    NSLog(@"Split Array : %@", splitArray);
    
    float red = [[splitArray objectAtIndex:0] floatValue]/255.0;
    float green = [[splitArray objectAtIndex:1] floatValue]/255.0;
    float blue = [[splitArray objectAtIndex:2] floatValue]/255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}


- (IBAction)button_next:(id)sender {
    LoginViewController *loginViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:loginViewController animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
