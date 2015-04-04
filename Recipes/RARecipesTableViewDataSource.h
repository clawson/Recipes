//
//  RecipesTableViewDataSource.h
//  Recipes
//
//  Created by Dan Clawson on 4/4/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RARecipesTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

@end
