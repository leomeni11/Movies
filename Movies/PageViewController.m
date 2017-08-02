//
//  PageViewController.m
//  Movies
//
//  Created by george on 11/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"

@interface PageViewController ()
{
    NSArray *movieArray;
}


@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = TRUE;
    movieArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"movies" ofType:@"plist"]];
    
    self.dataSource = self;
    
    ViewController *initialVC = (ViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialVC];
    
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

//helper method
- (UIViewController *) viewControllerAtIndex: (NSUInteger)index{
    ViewController *viewController  = [self. storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.introDictionary = movieArray[index];
    viewController.pageIndex = index;
    
    if(index == ([movieArray count] - 1))
        viewController.isLastPage = TRUE;
    
    return viewController;
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    if (index == 0 || index == NSNotFound){
        return nil;
    }
    index--; // or index = index -1
    
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == movieArray.count){
        return nil;
        
    }
    return [self viewControllerAtIndex:index];
    
}



@end
