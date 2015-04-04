//
//  RERecipeViewController.m
//  Recipes
//
//  Created by Dan Clawson on 4/4/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "RARecipeViewController.h"
#import "RARecipesTableViewDataSource.h"

@interface RARecipeViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RARecipesTableViewDataSource *dataSource;


@end

@implementation RARecipeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        // Customize here...
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Recipes";
    
    self.dataSource = [RARecipesTableViewDataSource new];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];

    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
