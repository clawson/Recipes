//
//  RecipesTableViewDataSource.m
//  Recipes
//
//  Created by Dan Clawson on 4/4/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "RARecipesTableViewDataSource.h"
#import "RARecipes.h"

static NSString * const cellIdentifier = @"identifier";

@implementation RARecipesTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [RARecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    
    return cell;
}

@end
