//
//  RERecipeViewController.m
//  Recipes
//
//  Created by Dan Clawson on 4/4/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "RARecipeViewController.h"
#import "RARecipesTableViewDataSource.h"
#import "RARecipeDetailViewController.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface RARecipeViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RARecipesTableViewDataSource *dataSource;

@end

@implementation RARecipeViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Recipes";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStyleGrouped];
    
    
    UIColor *backgroundColor = RGB(213.0, 226.0, 246.0);
    
    [self.tableView setBackgroundColor:backgroundColor];
    [self.view addSubview:self.tableView];

    self.dataSource = [RARecipesTableViewDataSource new];
    [self.dataSource registerTableView:self.tableView];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RARecipeDetailViewController *detailViewController = [RARecipeDetailViewController new];
    detailViewController.index = indexPath.row;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
