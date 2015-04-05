//
//  RARecipeDetailViewController.m
//  Recipes
//
//  Created by Dan Clawson on 4/4/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "RARecipeDetailViewController.h"
#import "RARecipes.h"

@implementation RARecipeDetailViewController

- (void) viewDidLoad {
    [super viewDidLoad];
//    
//    // Add a new table view
//    UITableView *detailTable = [[UITableView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:detailTable];
    
    NSDictionary *recipe = [RARecipes recipeAtIndex:self.index];
    
    NSLog(@"%@", recipe);
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = self.view.bounds;
    titleLabel.text = [RARecipes titleAtIndex:self.index];
    
    [self.view addSubview:titleLabel];
    
    
}

@end
